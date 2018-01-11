require "util"
require "math"

--===========--
-- Constants --
--===========--
TOXIC_DUMP_NAME					= 'emitter'
TOXIC_DUMP_INTERVAL				= 30 * 60	-- dump pollution every # ticks
TOXIC_DUMP_FILLPERCENT			= 0.5		-- When the toxic dump contains more than this percent of it's total capacity, release gas
TOXIC_DUMP_SLUDGE_PER_SEC		= 2.5		-- the amount of toxic sludge to remove per second at 100% capacity
TOXIC_DUMP_POLLUTION_RELEASED	= 100		-- the amount of pollution to add to the chunk when gas is released
TOXIC_DUMP_CLOUDS				= 1		-- the number of toxic clouds to create when gas is released
TOXIC_DUMP_SMOKE_MIN			= 1			-- the minimum number of trivial smoke clouds created when gas is released
TOXIC_DUMP_SMOKE_MAX			= 3			-- the maximum number of trivial smoke clouds created when gas is released

TOXIC_DUMP_CLOUD_SMALL			= 'toxic-cloud-small'
TOXIC_DUMP_CLOUD_MEDIUM			= 'toxic-cloud-medium'
TOXIC_DUMP_CLOUD_MEDIUM_PERCENT = 0.7
TOXIC_DUMP_CLOUD_LARGE			= 'toxic-cloud-large'
TOXIC_DUMP_CLOUD_LARGE_PERCENT = 0.9

POLLUTION_COLLECTOR_NAME		= 'airfilter'
POLLUTION_COLLECTOR_INTERVAL	= 30		-- collect pollution every # ticks
--POLLUTION_COLLECTION_PER_SEC	= 500		-- amount of pollution collected from the surface per second
POLLUTION_COLLECTION_MIN		= 50		-- minimum amount of pollution required for the collector to operate
POLLUTED_AIR_NAME				= 'polluted-air'


--==============--
-- Script Hooks --
--==============--
script.on_init( function() OnInit() end )
script.on_load( function() OnLoad() end )
script.on_event(defines.events.on_tick, function(_Event) OnTick(_Event) end)
script.on_event(defines.events.on_built_entity, function(_Event) OnBuiltEntity(_Event) end)
script.on_event(defines.events.on_robot_built_entity, function(_Event) OnBuiltEntity(_Event) end)
script.on_event(defines.events.on_pre_player_mined_item, function(event) OnEntityPreRemoved(event) end)
script.on_event(defines.events.on_robot_pre_mined, function(event) OnEntityPreRemoved(event) end)
script.on_event(defines.events.on_entity_died, function(event) OnEntityPreRemoved(event) end)

function OnInit()
	InitTables()
	--ScanAll()
end

function OnLoad()
	InitTables()
	--ScanAll()
end

function OnBuiltEntity(_Event)
	if IsToxicDump(_Event.created_entity) then
		AddToxicDump(_Event.created_entity)
	end
	if IsPollutionCollector(_Event.created_entity) then
		AddPollutionCollector(_Event.created_entity)
	end
end

function OnEntityPreRemoved(_Event)
	if IsToxicDump(_Event.entity) then
		RemoveToxicDump(_Event.entity)
	end
	if IsPollutionCollector(_Event.entity) then
		RemovePollutionCollector(_Event.entity)
	end
end

function OnTick(_Event)
	if game.tick % TOXIC_DUMP_INTERVAL == 0 then
		OnTick_ToxicDumps(_Event)
	end
	if game.tick % POLLUTION_COLLECTOR_INTERVAL == 0 then
		OnTick_PollutionCollectors(_Event)
	end
end


--===================--
-- Utility Functions --
--===================--
function IsPositionEqual(_Entity, _DatabaseEntity)
	return _Entity.surface == _DatabaseEntity.surface and _Entity.position.x == _DatabaseEntity.position.x and _Entity.position.y == _DatabaseEntity.position.y
end

function InitTables()
	if global.toxicDumps == nil then
		global.toxicDumps = {}
	end
	if global.collectors == nil then
		global.collectors = {}
	end
end

function ScanAll()
	for k in pairs(global.toxicDumps) do
		global.toxicDumps[k] = nil
	end
	for k in pairs(global.collectors) do
		global.collectors[k] = nil
	end
	for k,v in pairs(game.surfaces) do
		for key,_Entity in pairs(v.find_entities_filtered{name=TOXIC_DUMP_NAME}) do
			AddToxicDump(_Entity)
		end
		for key,_Entity in pairs(v.find_entities_filtered{name=POLLUTION_COLLECTOR_NAME}) do
			AddPollutionCollector(_Entity)
		end
	end
end

local pollutionPerRecipie = nil
function GetPollutionPerRecipie()
	if pollutionPerRecipie then return pollutionPerRecipie end
	for k, ingredient in pairs(game.players[1].force.recipes["collect-pollution"].ingredients) do
		if ingredient.name == POLLUTED_AIR_NAME then
			pollutionPerRecipie = ingredient.amount
			return pollutionPerRecipie
		end
	end
end

--================--
-- Loot Functions --
--================--

-- Can't access data directly?

local pollution_to_join_attack = {}
pollution_to_join_attack["small-biter"]			= 200
pollution_to_join_attack["medium-biter"] 		= 1000
pollution_to_join_attack["big-biter"]			= 4000
pollution_to_join_attack["behemoth-biter"]		= 20000
pollution_to_join_attack["small-spitter"]		= 200
pollution_to_join_attack["medium-spitter"]		= 600
pollution_to_join_attack["big-spitter"]			= 1500
pollution_to_join_attack["behemoth-spitter"]	= 10000
local max_health = {}
max_health["small-biter"]			= 15
max_health["medium-biter"] 			= 200
max_health["big-biter"]				= 375
max_health["behemoth-biter"]		= 3000
max_health["small-spitter"]			= 10
max_health["medium-spitter"]		= 50
max_health["big-spitter"]			= 200
max_health["behemoth-spitter"]		= 1500
max_health["small-worm-turret"]		= 200
max_health["medium-worm-turret"] 	= 400
max_health["big-worm-turret"]		= 750

function EnemyDied(event)
	if event.entity.force ~= game.forces.enemy or not event.force then return end
	
	local loot = {}
	local isPlayerKiller = false
	
	if event.entity.type == "unit" then
		log(event.entity.prototype.name .. " died")
		--local quantity = data.raw["unit"]["small-biter"].pollution_to_join_attack
		local quantity = (pollution_to_join_attack[event.entity.prototype.name] / 1000) * 2*math.random()
		
		if quantity >= 1 or quantity >= math.random() then
			loot = {name="xenomeros", count=math.ceil(quantity)}
			local isPlayerKiller = event.cause and (event.cause.type == "player" or event.cause.type == "car" or event.cause.type == "capsule")
			if not isPlayerKiller then
				event.entity.surface.spill_item_stack(event.entity.position, loot, true, event.force)
				return
			end
		else
			return
		end
	elseif event.entity.type == "unit-spawner" then
		loot = {name="xenovasi", count=math.ceil(5 * 2*math.random())}
		isPlayerKiller = false
	elseif event.entity.type == "turret" then
		loot = {name="xenomeros", count=math.ceil(10 * 2*math.random())}
		isPlayerKiller = false
	end
	
	if loot == {} or loot == nil then return end
	event.entity.surface.spill_item_stack(event.entity.position, loot, true)
end
script.on_event(defines.events.on_entity_died, function(event) EnemyDied(event) end)


--======================--
-- Toxic Dump Functions --
--======================--
function AddToxicDump(_Entity)
	local _Position = _Entity.position
	local _Surface = _Entity.surface.name
	table.insert( global.toxicDumps, {position = _Position, surface = _Surface} )
end

function RemoveToxicDump(_Entity)
	for key, _DatabaseEntity in pairs(global.toxicDumps) do
		if IsPositionEqual(_Entity, _DatabaseEntity) then
			table.remove(global.toxicDumps, key)
			break
		end
	end
end

function IsToxicDump(_Entity)
	return _Entity.name == TOXIC_DUMP_NAME
end

function OnTick_ToxicDumps(_Event)
	for k, v in pairs(global.toxicDumps) do
		local entities = game.surfaces[v.surface].find_entities_filtered{area = {{v.position.x - .25, v.position.y - .25}, {v.position.x + .25, v.position.y + .25}}, name = TOXIC_DUMP_NAME}
		for _,entity in pairs(entities) do
			if entity and entity.fluidbox and entity.fluidbox[1] then
				local capacity = entity.fluidbox.get_capacity(1)
				if entity.fluidbox[1].amount > (capacity * TOXIC_DUMP_FILLPERCENT) then
					local percentCapacity = entity.fluidbox[1].amount / capacity
					local pollutionMultiplier = 4 * (percentCapacity) - 1.9
					local current = entity.fluidbox[1]
					current.amount = current.amount - pollutionMultiplier * TOXIC_DUMP_SLUDGE_PER_SEC/60 * TOXIC_DUMP_INTERVAL
					entity.fluidbox[1] = current
					game.surfaces[v.surface].pollute({entity.position.x,entity.position.y}, pollutionMultiplier * TOXIC_DUMP_POLLUTION_RELEASED);
					local smokeNum = math.max(math.random(TOXIC_DUMP_SMOKE_MIN, TOXIC_DUMP_SMOKE_MAX),1)
					for i=1,smokeNum,1 do
						game.surfaces[v.surface].create_trivial_smoke{
							name = 'dump-smoke',
							position = {entity.position.x+math.random(-0.75,0.75),entity.position.y+math.random(-0.75,0.75)},
						}
					end
					local cloudToUse = TOXIC_DUMP_CLOUD_SMALL
					if percentCapacity > TOXIC_DUMP_CLOUD_LARGE_PERCENT then
						cloudToUse = TOXIC_DUMP_CLOUD_LARGE
					elseif percentCapacity > TOXIC_DUMP_CLOUD_MEDIUM_PERCENT then
						cloudToUse = TOXIC_DUMP_CLOUD_MEDIUM
					end
					for i = 1,math.max(math.ceil(percentCapacity * TOXIC_DUMP_CLOUDS),1),1 do
						game.surfaces[v.surface].create_entity({
							name=cloudToUse,
							amount=1,
							position={entity.position.x+0.01,entity.position.y+0.01},
						})
					end
				end
			end
		end
	end
end


--===============================--
-- Pollution Collector Functions --
--===============================--
function AddPollutionCollector(_Entity)
	local _Position = _Entity.position
	local _Surface = _Entity.surface.name
	table.insert( global.collectors, {position = _Position, surface = _Surface} )
end

function RemovePollutionCollector(_Entity)
	for key, _DatabaseEntity in pairs(global.collectors) do
		if IsPositionEqual(_Entity, _DatabaseEntity) then
			table.remove(global.collectors, key)
			break
		end
	end
end

function IsPollutionCollector(_Entity)
	return _Entity.name == POLLUTION_COLLECTOR_NAME
end

function OnTick_PollutionCollectors(_Event)
	for k, collector in pairs(global.collectors) do
		if POLLUTION_COLLECTION_MIN < game.surfaces[collector.surface].get_pollution(collector.position) then
			local entities = game.surfaces[collector.surface].find_entities_filtered{area = {{collector.position.x - .25, collector.position.y - .25}, {collector.position.x + .25, collector.position.y + .25}}, name = POLLUTION_COLLECTOR_NAME}
			for _,entity in pairs(entities) do
				if entity and entity.fluidbox then
					for fluidIndex=1,#entity.fluidbox,1 do
						local filter = entity.fluidbox.get_filter(fluidIndex)
						if filter and filter.name == POLLUTED_AIR_NAME and entity.is_connected_to_electric_network() then
							CollectPollution(entity, fluidIndex, collector.surface)
							break
						end
					end
				end
			end
		end
	end
end

function CollectPollution(entity, fluidIndex, surface)
	local contents = entity.fluidbox[fluidIndex]
	if contents == nil then
		contents = {
			name = POLLUTED_AIR_NAME,
			amount = 0,
		}
	end
	
	local surfacePollution = game.surfaces[surface].get_pollution(entity.position)
	local capacity = 2 * GetPollutionPerRecipie()
	local pollution = 0
	
	--local pollution = entity.prototype.crafting_speed * POLLUTION_COLLECTOR_INTERVAL * POLLUTION_COLLECTION_PER_SEC / 60 
	--pollution = math.min(pollution, capacity - contents.amount)
	
	local pollution = math.min(capacity - contents.amount, surfacePollution)
	
	if (pollution <= 0) then return end
	
	contents.amount = contents.amount + pollution
	game.surfaces[surface].pollute(entity.position, -1 * pollution);
	entity.fluidbox[fluidIndex] = contents
end

function ReplaceEntities(original, replacement)
	local s = game.local_player.surface
	for chunk in s.get_chunks() do
		local entities = s.find_entities_filtered{name=original, area={{chunk.x*32, chunk.y*32}, {(chunk.x+1)*32, (chunk.y+1)*32}}}
		for _, entity in pairs(entities) do
			s.create_entity{name=replacement, position=entity.position, force=game.local_player.force}
			entity.destroy()
		end
	end
end