require "util"

--find_entities_filtered doesn't work at this step?
script.on_init(FindOutposts)
script.on_load(FindOutposts)

function FindOutposts()
	if global.outposts and next(global.outposts) then return end
	global.outposts = {}
	for k in pairs(global.outposts) do
		global.outposts[k] = nil
	end
	for _,surface in pairs(game.surfaces) do
		for _,entity in ipairs(surface.find_entities_filtered{name="radar-outpost"}) do
			global.outposts[entity] = true
		end
	end
end

script.on_event(defines.events.on_built_entity, function(event)
	if event.created_entity.name == "radar-outpost" then
		global.outposts[event.created_entity] = true
	end
end)

script.on_event(defines.events.on_robot_built_entity, function(event)
	if event.created_entity.name == "radar-outpost" then
		global.outposts[event.created_entity] = true
	end
end)

---[[
script.on_event(defines.events.on_tick, function(event)
	if game.tick % 300 == 0 then
		FindOutposts()
	end
	if not global.outposts then return end
	for entity,_ in pairs(global.outposts) do
		if entity.valid then
			entity.energy = 10000000000
		else
			global.outposts[entity] = nil
		end
	end
end)
--]]