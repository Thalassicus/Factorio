require "util"

------------
-- Entity --
------------
--[[
local horizontalChest = makeNewEntityFromData("container","wooden-chest","horizontal-chest")
horizontalChest.inventory_size = 40
horizontalChest.collision_box  = {{-0.35, -2.7}, {0.35, 2.7}}
horizontalChest.selection_box  = {{-0.5, -3.0}, {0.5, 3.0}}

local verticalChest = makeNewEntityFromData("container","wooden-chest","vertical-chest")
	
verticalChest.picture.layers[currentIndex].hr_version = copyData("container","wooden-chest","picture")
verticalChest.picture.layers[currentIndex].filename = "__ThalStorage__/graphics/entity/rail_chest_v6.png"
verticalChest.picture.layers[currentIndex].width    = 46
verticalChest.picture.layers[currentIndex].height   = 187
verticalChest.picture.layers[currentIndex].scale    = 0.3333
verticalChest.picture.layers[currentIndex].shift    = nil
verticalChest.picture.layers[currentIndex].draw_as_shadow = true
verticalChest.picture.layers[currentIndex].hr_version.filename = "__ThalStorage__/graphics/entity/rail_chest_v6.png"
verticalChest.picture.layers[currentIndex].hr_version.width    = 46
verticalChest.picture.layers[currentIndex].hr_version.height   = 187
verticalChest.picture.layers[currentIndex].hr_version.scale    = 0.1666
verticalChest.picture.layers[currentIndex].hr_version.shift    = nil
verticalChest.picture.layers[currentIndex].hr_version.draw_as_shadow = true
verticalChest.circuit_wire_connection_point = circuit_connector_definitions["assembling-machine"].points
verticalChest.circuit_connector_sprites = circuit_connector_definitions["assembling-machine"].sprites


local verticalChest = makeNewEntityFromData("container","wooden-chest","horizontal-chest")
verticalChest.inventory_size = 19
verticalChest.collision_box  = {{-0.75, -0.75}, {0.75, 0.75}}
verticalChest.selection_box  = {{-1.0, -1.0}, {1.0, 1.0}}
verticalChest.picture = {
	layers =
	{
		copyData("container","wooden-chest","picture"),
		copyData("container","wooden-chest","picture"),
		copyData("container","wooden-chest","picture"),
		copyData("container","wooden-chest","picture")
	}
}
currentIndex = 1

currentIndex=currentIndex+1

----------
-- Item --
----------
local horizontalChest_item = makeNewItemFromData("item","wooden-chest","vertical-chest")
horizontalChest_item.stack_size = 10
horizontalChest_item.icon       = "__ThalStorage__/graphics/icons/rail_loading_yard_icon.png"
horizontalChest_item.icon_size   = 64

local verticalChest_item = makeNewItemFromData("item","wooden-chest","horizontal-chest")
verticalChest_item.stack_size = 10
verticalChest_item.icon       = "__ThalStorage__/graphics/icons/rail_loading_yard_icon.png"
verticalChest_item.icon_size   = 64

--------------
-- Database --
--------------
--[[
data:extend({
	horizontalChest,
	horizontalChest_item,
	{
		type = "recipe",
		name = "vertical-chest",
		energy_required = 1,
		enabled = true,
		ingredients =
		{
			{name="wooden-chest", amount=3},
		},
		result= "vertical-chest"
	},
	verticalChest,
	verticalChest_item,
	{
		type = "recipe",
		name = "horizontal-chest",
		energy_required = 1,
		enabled = true,
		ingredients =
		{
			{name="wooden-chest", amount=2},
		},
		result= "horizontal-chest"
	},
})
--]]