require "util"
require "math"
require "constants"

--error("TOXIC_SLUDGE_RATIO = " .. TOXIC_SLUDGE_RATIO)

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
	if _Event.entity then
		if IsToxicDump(_Event.entity) then
			RemoveToxicDump(_Event.entity)
		elseif IsPollutionCollector(_Event.entity) then
			RemovePollutionCollector(_Event.entity)
		else
			DisperseCollectedPollution(_Event.entity, _Event.entity.surface.name, _Event.entity.position)
		end
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
	--error("Is surface equal: "..tostring(_Entity.surface.name == _DatabaseEntity.surface).."\nIs Xpos equal: "..tostring(_Entity.position.x == _DatabaseEntity.position.x).."\nIs Ypos equal: "..tostring(_Entity.position.y == _DatabaseEntity.position.y).."\n\nSurface: "..tostring(_Entity.surface.name).." == "..tostring(_DatabaseEntity.surface).." ("..tostring(_Entity.position.x)..", "..tostring(_Entity.position.y)..") == ("..tostring(_DatabaseEntity.position.x)..", "..tostring(_DatabaseEntity.position.y)..")")
	return _Entity.surface.name == _DatabaseEntity.surface and _Entity.position.x == _DatabaseEntity.position.x and _Entity.position.y == _DatabaseEntity.position.y
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

--[[
local pollutionPerRecipe = nil
function GetPollutionPerRecipe()
	if pollutionPerRecipe then return pollutionPerRecipe end
	for k, ingredient in pairs(game.players[1].force.recipes["liquify-pollution"].ingredients) do
		if ingredient.name == POLLUTED_AIR_NAME then
			pollutionPerRecipe = ingredient.amount
			return pollutionPerRecipe
		end
	end
end
--]]

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

function EntityDied(event)
	if event.entity.force ~= game.forces.enemy or not event.force then return end
	
	local loot = {}
	local isPlayerKiller = false
	
	if event.entity.type == "unit" then
		log(event.entity.prototype.name .. " died")
		-- Scaling values result in too little early xenomass, and too much in late game
		local quantity = 0.5
		--local quantity = data.raw["unit"]["small-biter"].pollution_to_join_attack
		--local quantity = (max_health[event.entity.prototype.name] / 200) * 2*math.random()
		
		if quantity >= 1 or quantity >= math.random() then
			loot = {name="xenomeros", count=math.ceil(quantity)}
			isPlayerKiller = event.cause and (event.cause.type == "player" or event.cause.type == "car" or event.cause.type == "capsule")
		else
			return
		end
	elseif event.entity.type == "unit-spawner" then
		loot = {name="xenovasi", count=math.ceil(5 * 2*math.random())}
		isPlayerKiller = false
	elseif event.entity.type == "turret" then
		local quantity = (max_health[event.entity.prototype.name] / 200) * 2*math.random()
		if quantity >= 1 or quantity >= math.random() then
			loot = {name="xenomeros", count=math.ceil(10 * 2*math.random())}
			isPlayerKiller = false
		else
			return
		end
	end
	
	if loot == {} or loot == nil then return end
	if event.force == game.forces.neutral or event.force == game.forces.enemy then
		event.entity.surface.spill_item_stack(event.entity.position, loot, true)
		return
	end
	event.entity.surface.spill_item_stack(event.entity.position, loot, true, event.force)
	return
end
script.on_event(defines.events.on_entity_died, function(event) EntityDied(event) end)


--=================================--
-- Pollution Destruction Functions --
--=================================--

-- WIP. Converts stored pollution into air pollution when entities are destroyed, to prevent manual destruction of pollution. Needs to be implemented on destruction of pipes?, storage tanks, fluid wagons, etc
function DisperseCollectedPollution(_Entity, _Surface, _Position)
	if _Entity.fluidbox then
		for k=1, #_Entity.fluidbox, 1 do
		--for k,v in pairs(_Entity.fluidbox) do
			if _Entity.fluidbox[k] then
				local storedFluid = _Entity.fluidbox[k]
				--error("Fluid Name: "..tostring(_Entity.fluidbox[k].name))
				--error("Fluid Name: "..tostring(storedFluid.name))
				ConvertFluidToPollution(_Surface, _Position, storedFluid.name, storedFluid.amount, true)
				--[[
				if storedFluid.name == POLLUTED_AIR_NAME then
					game.surfaces[_Surface].pollute(_Position, storedFluid.amount * POLLUTED_AIR_RATIO);
				elseif storedFluid.name == TOXIC_SLUDGE_NAME then
					game.surfaces[_Surface].pollute(_Position, storedFluid.amount * POLLUTED_AIR_RATIO * TOXIC_SLUDGE_RATIO);
				end--]]
				storedFluid.amount = 0
				_Entity.fluidbox[k] = storedFluid
			end
		end
	end
end

function ConvertFluidToPollution(_Surface, _Position, _Type, _Amount, _DoDisperse)
	_DoDisperse = _DoDisperse or false
	local convertedAmount = _Amount
	if _Type == POLLUTED_AIR_NAME then
		convertedAmount = _Amount  * POLLUTED_AIR_RATIO
	elseif _Type == TOXIC_SLUDGE_NAME then
		convertedAmount = _Amount  * POLLUTED_AIR_RATIO * TOXIC_SLUDGE_RATIO
	else
		_DoDisperse = false
	end
	if _DoDisperse then game.surfaces[_Surface].pollute(_Position, convertedAmount) end
	return convertedAmount
end


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
			DisperseCollectedPollution(_Entity, _DatabaseEntity.surface, _Entity.position)
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
			if entity and entity.fluidbox and entity.fluidbox[1] and (entity.fluidbox[1].name == POLLUTED_AIR_NAME or entity.fluidbox[1].name == TOXIC_SLUDGE_NAME) then
				local capacity = entity.fluidbox.get_capacity(1)
				local storedFluid = entity.fluidbox[1]
				local fillPercent = storedFluid.amount / capacity
				if fillPercent > TOXIC_DUMP_FILLPERCENT then
					local pollutionToDump = storedFluid.amount
					if storedFluid.name == POLLUTED_AIR_NAME then
						pollutionToDump = storedFluid.amount * (1-(TOXIC_DUMP_CONSUME_PERCENT/TOXIC_SLUDGE_RATIO))
					elseif storedFluid.name == TOXIC_SLUDGE_NAME then
						pollutionToDump = storedFluid.amount * (1-(TOXIC_DUMP_CONSUME_PERCENT))
					end
					ConvertFluidToPollution(v.surface, entity.position, storedFluid.name, pollutionToDump, true)
					storedFluid.amount = 0
					entity.fluidbox[1] = storedFluid
					
					--local percentCapacity = entity.fluidbox[1].amount / capacity
					--local pollutionMultiplier = 4 * (percentCapacity) - 1.9
					--local current = entity.fluidbox[1]
					--current.amount = current.amount - pollutionMultiplier * TOXIC_DUMP_SLUDGE_PER_SEC/60 * TOXIC_DUMP_INTERVAL
					--entity.fluidbox[1] = current
					--game.surfaces[v.surface].pollute({entity.position.x,entity.position.y}, pollutionMultiplier * TOXIC_DUMP_POLLUTION_RELEASED);
					local smokeNum = math.max(math.random(TOXIC_DUMP_SMOKE_MIN, TOXIC_DUMP_SMOKE_MAX),1)
					for i=1,smokeNum,1 do
						game.surfaces[v.surface].create_trivial_smoke{
							name = 'dump-smoke',
							position = {entity.position.x+math.random(-0.75,0.75),entity.position.y+math.random(-0.75,0.75)},
						}
					end
					local cloudToUse = TOXIC_DUMP_CLOUD_SMALL
					if fillPercent > TOXIC_DUMP_CLOUD_LARGE_PERCENT then
						cloudToUse = TOXIC_DUMP_CLOUD_LARGE
					elseif fillPercent > TOXIC_DUMP_CLOUD_MEDIUM_PERCENT then
						cloudToUse = TOXIC_DUMP_CLOUD_MEDIUM
					end
					for i = 1,math.max(math.ceil(fillPercent * TOXIC_DUMP_CLOUDS),1),1 do
						game.surfaces[v.surface].create_entity({
							name=cloudToUse,
							amount=1,
							force=entity.force,
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
			DisperseCollectedPollution(_Entity, _DatabaseEntity.surface, _Entity.position)
			table.remove(global.collectors, key)
			break
		end
	end
end

function IsPollutionCollector(_Entity)
	return _Entity.name == POLLUTION_COLLECTOR_NAME
end

function GetNearbyPollution(_Surface, _Position)
	local totalPollution = {}
	totalPollution.center	= {pollution = game.surfaces[_Surface].get_pollution(_Position), position = _Position}
	totalPollution.left		= {pollution = game.surfaces[_Surface].get_pollution({x=_Position.x+32,y=_Position.y}), position = {x=_Position.x+32,y=_Position.y}}
	totalPollution.right	= {pollution = game.surfaces[_Surface].get_pollution({x=_Position.x-32,y=_Position.y}), position = {x=_Position.x-32,y=_Position.y}}
	totalPollution.up		= {pollution = game.surfaces[_Surface].get_pollution({x=_Position.x,y=_Position.y+32}), position = {x=_Position.x,y=_Position.y+32}}
	totalPollution.down		= {pollution = game.surfaces[_Surface].get_pollution({x=_Position.x,y=_Position.y-32}), position = {x=_Position.x,y=_Position.y-32}}
	return totalPollution--game.surfaces[_Surface].get_pollution(_Position)
end

function DecreaseNearbyPollution(_Surface, _Position, _Amounts)
	for k,v in pairs(_Amounts) do
		game.surfaces[_Surface].pollute(v.position, -1 * v.pollution);
	end
end

function OnTick_PollutionCollectors(_Event)
	for k, collector in pairs(global.collectors) do
		--if POLLUTION_COLLECTION_MIN < game.surfaces[collector.surface].get_pollution(collector.position) then
			local entities = game.surfaces[collector.surface].find_entities_filtered{area = {{collector.position.x - .25, collector.position.y - .25}, {collector.position.x + .25, collector.position.y + .25}}, name = POLLUTION_COLLECTOR_NAME}
			for _,entity in pairs(entities) do
				if entity then
					CollectPollution(entity, collector.surface)
				end
			end
		--end
	end
end

function CollectPollution(entity, surface)
	local contents = entity.fluidbox[1]
	if contents == nil then
		contents = {
			name = POLLUTED_AIR_NAME,
			amount = 0,
		}
	end
	
	local nearbyPollution = GetNearbyPollution(surface, entity.position)
	--local targetPollution = nearbyPollution.center
	local bonusAmount_Possible = 0
	for k,v in pairs(nearbyPollution) do
		local targetGatherAmount = v.pollution
		local maxPercent = POLLUTION_COLLECTION_MAX_PERCENT/4.0
		if( k == "center" ) then
			maxPercent = POLLUTION_COLLECTION_MAX_PERCENT
		end
		----[[
		--if( v.pollution < POLLUTION_COLLECTION_MIN ) then
		--	targetGatherAmount = 0
		--end
		if( v.pollution >= POLLUTION_COLLECTION_MIN) then
			targetGatherAmount = POLLUTION_COLLECTION_MIN
		end
		if( v.pollution * maxPercent >= POLLUTION_COLLECTION_MIN ) then
			targetGatherAmount = v.pollution * maxPercent
		end
		--]]
		nearbyPollution[k].pollution = targetGatherAmount
		if( k ~= "center" ) then
			bonusAmount_Possible = bonusAmount_Possible + targetGatherAmount
		end
	end
	
	local capacityRemaining = (entity.fluidbox.get_capacity(1) - contents.amount) * POLLUTED_AIR_RATIO
	local pollution 		= 0
	local bonusMultiplier	= 0.0
	if( (nearbyPollution.center.pollution + bonusAmount_Possible) <= capacityRemaining ) then
		bonusMultiplier = 1.0
	elseif( nearbyPollution.center.pollution < capacityRemaining ) then
		capacityRemaining = capacityRemaining - nearbyPollution.center.pollution
		bonusMultiplier   = capacityRemaining / bonusAmount_Possible
		bonusAmount_Possible = bonusAmount_Possible * bonusMultiplier
	else
		nearbyPollution.center.pollution = capacityRemaining
		bonusMultiplier = 0.0
	end
	
	pollution = nearbyPollution.center.pollution + bonusAmount_Possible
	for k,v in pairs(nearbyPollution) do
		if( k ~= "center" ) then
			nearbyPollution[k].pollution = nearbyPollution[k].pollution * bonusMultiplier
		end
	end
	
	if (pollution <= 0) then return end
	
	contents.amount = contents.amount + (pollution / POLLUTED_AIR_RATIO)
	DecreaseNearbyPollution(surface, entity.position, nearbyPollution)
	entity.fluidbox[1] = contents
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