require "util"
require "math"

script.on_init(function()
  if global.outposts == nil then
    global.outposts = {}
  end
end)

script.on_load(function()
  if global.outposts == nil then
    global.outposts = {}
  end
end)

script.on_event(defines.events.on_built_entity, function(event)
	if event.created_entity.name == "radar-outpost" then
		event.created_entity.energy = math.pow(2,1024)
		global.outposts[event.created_entity.position] = 1
	end
end)

script.on_event(defines.events.on_robot_built_entity, function(event)
	if event.created_entity.name == "radar-outpost" then
		event.created_entity.energy = math.pow(2,1024)
		global.outposts[event.created_entity.position] = 1
	end
end)

----[[
script.on_event(defines.events.on_tick, function(event)
    for k, v in pairs(global.outposts) do
		local entities = game.surfaces[1].find_entities_filtered{area = {{k.x - .25, k.y - .25}, {k.x + .25, k.y + .25}}, name = 'radar-outpost'}
		for _,entity in pairs(entities) do
			entity.energy = entity.energy + math.pow(2,1024)
        end
	end
end)
--]]