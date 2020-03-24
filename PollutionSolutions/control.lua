require "util"
--require "math"
require "constants"

--error("AIR_PER_SLUDGE = " .. AIR_PER_SLUDGE)

--==============--
-- Script Hooks --
--==============--
script.on_event(defines.events.on_tick, function(event) OnTick(event) end)
script.on_event(defines.events.on_built_entity, function(event) OnBuiltEntity(event) end)
script.on_event(defines.events.on_robot_built_entity, function(event) OnBuiltEntity(event) end)
script.on_event(defines.events.on_pre_player_mined_item, function(event) OnEntityPreRemoved(event) end)
script.on_event(defines.events.on_robot_pre_mined, function(event) OnEntityPreRemoved(event) end)
script.on_event(defines.events.on_entity_died, function(event) OnEntityPreRemoved(event) end)
script.on_event(defines.events.on_entity_died, function(event) EntityDied(event) end)

function OnBuiltEntity(event)
	if IsToxicDump(event.created_entity) then
		AddToxicDump(event.created_entity)
	end
	if IsPollutionCollector(event.created_entity) then
		AddPollutionCollector(event.created_entity)
	end
end

function OnEntityPreRemoved(event)
	if event.entity then
		if IsToxicDump(event.entity) then
			RemoveToxicDump(event.entity)
		elseif IsPollutionCollector(event.entity) then
			RemovePollutionCollector(event.entity)
		else
			DisperseCollectedPollution(event.entity, event.entity.surface, event.entity.position)
		end
	end
end

function OnTick(event)
	--ResetGlobals()
	if game.tick % 300 == 0 then
		FindDumps()
		FindCollectors()
		--game.players[1].insert{name="red-xenomass", count=50}
		--game.players[1].insert{name="blue-xenomass", count=1000}
	end
	if game.tick % TOXIC_DUMP_INTERVAL == 0 then
		OnTick_ToxicDumps(event)
	end
	if game.tick % settings.global["zpollution-collection-interval"].value == 0 then
		OnTick_PollutionCollectors(event)
	end
end

function ResetGlobals()
	global.toxicDumps = nil
	global.collectors = nil
	global.nestsKilled = nil
	global.spilledLoot = nil
	global.lootToCheck = nil
end


--===================--
-- Utility Functions --
--===================--
function IsPositionEqual(entity, _DatabaseEntity)
	--error("Is surface equal: "..tostring(entity.surface == _DatabaseEntity.surface).."\nIs Xpos equal: "..tostring(entity.position.x == _DatabaseEntity.position.x).."\nIs Ypos equal: "..tostring(entity.position.y == _DatabaseEntity.position.y).."\n\nSurface: "..tostring(entity.surface).." == "..tostring(_DatabaseEntity.surface).." ("..tostring(entity.position.x)..", "..tostring(entity.position.y)..") == ("..tostring(_DatabaseEntity.position.x)..", "..tostring(_DatabaseEntity.position.y)..")")
	return entity.surface == _DatabaseEntity.surface and entity.position.x == _DatabaseEntity.position.x and entity.position.y == _DatabaseEntity.position.y
end

function FindDumps()
	if global.toxicDumps and next(global.toxicDumps) then return end
	global.toxicDumps = {}
	for _,surface in pairs(game.surfaces) do
		for _,entity in pairs(surface.find_entities_filtered{name=TOXIC_DUMP_NAME}) do
			AddToxicDump(entity)
		end
	end
end

function FindCollectors()
	if global.collectors and next(global.collectors) then return end
	global.collectors = {}
	for _,surface in pairs(game.surfaces) do
		for _,entity in pairs(surface.find_entities_filtered{name=POLLUTION_COLLECTOR_NAME}) do
			AddPollutionCollector(entity)
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

--====================--
-- Loot Functionality --
--====================--

function EntityDied(event)
	local alien = event.entity
	if alien.force ~= game.forces.enemy or not event.force then return end
	if global.nestsKilled == nil then global.nestsKilled = 0 end
	if global.spilledLoot == nil then global.spilledLoot = {} end
	if global.lootToCheck == nil then global.lootToCheck = {} end
	
	local loot = {}	
	local quantity = 0
	if alien.type == "unit" then
		quantity = 2*math.random() * settings.global["zpollution-blue-per-alien"].value
		loot = {name="blue-xenomass", count=math.floor(quantity+0.5)}
	elseif alien.type == "turret" then
		quantity = 2*math.random() * settings.global["zpollution-blue-per-alien"].value * 5
		loot = {name="blue-xenomass", count=math.floor(quantity+0.5)}
	elseif alien.type == "unit-spawner" then
		global.nestsKilled = global.nestsKilled + 1
		--log("global.nestsKilled=" .. global.nestsKilled)
		quantity = math.ceil(settings.global["zpollution-red-per-alien"].value / global.nestsKilled)
		loot = {name="red-xenomass", count=quantity}
		--log(alien.name .. " died; create " .. quantity .. " xenomass")
	end
	--log(alien.name .. " died; create " .. quantity .. " xenomass")
	local safetyRadius = settings.global["zpollution-pickup-safety-radius"].value
	if next(loot) and loot.count >= 1 then
		local isArtillery = event.cause.type == "artillery-wagon" or event.cause.type == "artillery-turret" or event.cause.type == "artillery-projectile"
		if safetyRadius == 0 or isArtillery then
			alien.surface.spill_item_stack(alien.position, loot, event.force)
			return
		else
			alien.surface.spill_item_stack(alien.position, loot)
		end
	end

	if IsEnemyNear(alien, 2 * safetyRadius) then
		-- remember my loot for later pickup
		local nearItems = alien.surface.find_entities_filtered{
				position=alien.position,
				radius=5,
				name="item-on-ground"
		}
		for _,checkLoot in pairs(nearItems) do
			if checkLoot.stack.name == loot.name and checkLoot.to_be_deconstructed(event.force) == false then
				if global.spilledLoot[checkLoot] == nil then
					checkLoot.to_be_looted = true
					global.spilledLoot[checkLoot] = {force=event.force}
				end
			end
		end
	else
		--log(alien.name .. " died as last survivor.")
		for checkLoot,info in pairs(global.spilledLoot) do
			if not checkLoot.valid then
				--log("manually looted")
				global.spilledLoot[checkLoot] = nil
			else
				if Distance(alien, checkLoot) < safetyRadius then
					checkLoot.to_be_looted = true
					checkLoot.order_deconstruction(info.force)
					global.spilledLoot[checkLoot] = nil
				end
			end
		end
		-- check loot spilled outside my safety-radius
		global.lootToCheck = {}
		for checkLoot,_ in pairs(global.spilledLoot) do
			global.lootToCheck[checkLoot] = true
		end
		for checkLoot,_ in pairs(global.lootToCheck) do
			if global.lootToCheck[checkLoot] == true then
				AttemptMarkForPickup(checkLoot, safetyRadius)
			end
		end
	end
end

function GetPositionString(entity)
	return math.floor(entity.position.x) ..",".. math.floor(entity.position.y)
end

function AttemptMarkForPickup(thisLoot, safetyRadius)
	local enemyNear = IsEnemyNear(thisLoot, safetyRadius)
	-- remove myself and neighbors from global.lootToCheck
	local halfRadius = safetyRadius / 2
	local stillToCheck = {}
	for checkLoot,v in pairs(global.lootToCheck) do
		if global.lootToCheck[checkLoot] == true then
			if Distance(thisLoot, checkLoot) < halfRadius then
				if not enemyNear then
					MarkForPickup(checkLoot)
				end
				global.lootToCheck[checkLoot] = nil
			end
		end
	end
end

function MarkForPickup(thisLoot)
	if not thisLoot.valid then
		global.lootToCheck[thisLoot] = nil
		global.spilledLoot[thisLoot] = nil
		return
	end
	if global.spilledLoot[thisLoot] == nil then
		--log("Loot at " .. math.floor(checkLoot.position.x) ..",".. math.floor(checkLoot.position.y) .. " is not in global.spilledLoot")
		return
	end
	local force = global.spilledLoot[thisLoot].force
	if force == game.forces.neutral or force == game.forces.enemy then
		thisLoot.order_deconstruction()
	else
		thisLoot.order_deconstruction(force)
	end
	global.spilledLoot[thisLoot] = nil
end

function Distance(a, b)
  local dx = a.position.x - b.position.x
  local dy = a.position.y - b.position.y
  return math.sqrt(dx * dx + dy * dy)
end

function IsEnemyNear(entity, radius)
	local entities = entity.surface.find_entities_filtered{
		position=entity.position,
		radius=radius,
		type={"unit", "turret"},
		force="enemy",
	}
	for _, nearby in pairs(entities) do
		--log(nearby.name .. ".health=" .. nearby.health)
		if nearby.health > 0 then
			return true
		end
	end	
	return false
end

--=================================--
-- Pollution Destruction Functions --
--=================================--

-- Converts stored pollution into air pollution when entities are destroyed, to prevent manual destruction of pollution.
function DisperseCollectedPollution(entity, surface, position)
	if entity.fluidbox then
		for k=1, #entity.fluidbox, 1 do
			if entity.fluidbox[k] then
				local storedFluid = entity.fluidbox[k]
				--error("Fluid Name: "..tostring(entity.fluidbox[k].name))
				--error("Fluid Name: "..tostring(storedFluid.name))
				ConvertFluidToPollution(surface, position, storedFluid.name, storedFluid.amount, true)
				storedFluid.amount = 0.0001
				entity.fluidbox[k] = storedFluid
			end
		end
	end
end

function ConvertFluidToPollution(surface, position, _Type, _Amount, _DoDisperse)
	_DoDisperse = _DoDisperse or false
	local convertedAmount = _Amount
	if _Type == POLLUTED_AIR_NAME then
		convertedAmount = _Amount  * EMISSIONS_PER_AIR
	elseif _Type == TOXIC_SLUDGE_NAME then
		convertedAmount = _Amount  * EMISSIONS_PER_AIR * AIR_PER_SLUDGE
	else
		_DoDisperse = false
	end
	if _DoDisperse then surface.pollute(position, convertedAmount) end
	return convertedAmount
end


--======================--
-- Toxic Dump Functions --
--======================--
function AddToxicDump(entity)
	table.insert( global.toxicDumps, {position = entity.position, surface = entity.surface} )
end

function RemoveToxicDump(entity)
	for key, _DatabaseEntity in pairs(global.toxicDumps) do
		if IsPositionEqual(entity, _DatabaseEntity) then
			DisperseCollectedPollution(entity, _DatabaseEntity.surface, entity.position)
			table.remove(global.toxicDumps, key)
			break
		end
	end
end

function IsToxicDump(entity)
	return entity.name == TOXIC_DUMP_NAME
end

function OnTick_ToxicDumps(event)
	if global.toxicDumps == nil or not next(global.toxicDumps) then return end
	for k, v in pairs(global.toxicDumps) do
		local entities = v.surface.find_entities_filtered{area = {{v.position.x - .25, v.position.y - .25}, {v.position.x + .25, v.position.y + .25}}, name = TOXIC_DUMP_NAME}
		for _,entity in pairs(entities) do
			if entity and entity.fluidbox and entity.fluidbox[1] and (entity.fluidbox[1].name == POLLUTED_AIR_NAME or entity.fluidbox[1].name == TOXIC_SLUDGE_NAME) then
				local capacity = entity.fluidbox.get_capacity(1)
				local storedFluid = entity.fluidbox[1]
				local fillPercent = storedFluid.amount / capacity
				if fillPercent > TOXIC_DUMP_FILLPERCENT and storedFluid.amount > 1 then
					local pollutionToDump = storedFluid.amount
					if storedFluid.name == POLLUTED_AIR_NAME then
						pollutionToDump = storedFluid.amount * (1-(TOXIC_DUMP_CONSUME_PERCENT/AIR_PER_SLUDGE))
					elseif storedFluid.name == TOXIC_SLUDGE_NAME then
						pollutionToDump = storedFluid.amount * (1-(TOXIC_DUMP_CONSUME_PERCENT))
					end
					ConvertFluidToPollution(v.surface, entity.position, storedFluid.name, pollutionToDump, true)
					storedFluid.amount = 0.0001
					entity.fluidbox[1] = storedFluid
					
					local smokeNum = math.max(math.random(TOXIC_DUMP_SMOKE_MIN, TOXIC_DUMP_SMOKE_MAX),1)
					for i=1,smokeNum,1 do
						v.surface.create_trivial_smoke{
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
						v.surface.create_entity({
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

function IsPollutionCollector(entity)
	return entity.name == POLLUTION_COLLECTOR_NAME
end

function AddPollutionCollector(entity)
	global.collectors[entity.unit_number] = entity
end

function RemovePollutionCollector(entity)
	DisperseCollectedPollution(entity, entity.surface, entity.position)
	global.collectors[entity.unit_number] = nil
end

function CollectPollution(entity, surface)
	local contents = entity.fluidbox[1]
	if contents == nil then
		contents = {
			name = POLLUTED_AIR_NAME,
			amount = 0.0000001,
		}
	end
	--log("collecting at " .. GetPositionString(entity))
	local capacityRemaining = (entity.fluidbox.get_capacity(1) - contents.amount) * EMISSIONS_PER_AIR		
	if capacityRemaining <= 0 then return end

	local neighbors = GetPollutionNeighbors(surface, entity.position)
	local maxCollection = 0
	for x = -1,1 do
		for y = -1,1 do
			maxCollection = maxCollection + neighbors[x][y].maxCollection
		end
	end
	--log("    maxCollection=" .. maxCollection)
	if maxCollection <= 0 then return end

	local collectionMultiplier = 1
	if capacityRemaining < maxCollection then
		collectionMultiplier = capacityRemaining / maxCollection
	end

	for x = -1,1 do
		for y = -1,1 do
			local emissionChange = collectionMultiplier * neighbors[x][y].maxCollection
			surface.pollute(neighbors[x][y].position, -1 * emissionChange)
			contents.amount = contents.amount + (emissionChange / EMISSIONS_PER_AIR)
		end
	end

	entity.fluidbox[1] = contents
end

function GetPollutionNeighbors(surface, position)
	local neighbors = {}
	for nearX = -1,1 do
		neighbors[nearX] = {}
		for nearY = -1,1 do
			neighbors[nearX][nearY] = {}
			neighbors[nearX][nearY].position = {x = position.x + 32*nearX, y = position.y + 32*nearY}
			neighbors[nearX][nearY].pollution = surface.get_pollution(neighbors[nearX][nearY].position)
			neighbors[nearX][nearY].maxCollection = math.max(0, (neighbors[nearX][nearY].pollution - settings.global["zpollution-pollution-remaining"].value) / settings.global["zpollution-collectors-required"].value)
		end
	end
	return neighbors
end

function OnTick_PollutionCollectors(event)
	if global.collectors == nil or not next(global.collectors) then return end
	for _,entity in pairs(global.collectors) do
		if entity.valid then
			CollectPollution(entity, entity.surface)
		else
			global.collectors[entity.unit_number] = nil
		end
	end
end