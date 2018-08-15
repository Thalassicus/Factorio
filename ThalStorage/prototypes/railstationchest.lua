require "util"

------------
-- Entity --
------------
local railloadingyard = makeNewEntityFromData("container","wooden-chest","rail-loading-yard")
railloadingyard.inventory_size = 40
railloadingyard.collision_box  = {{-1.25, -1.25}, {1.25, 1.25}}
railloadingyard.selection_box  = {{-1.5, -1.5}, {1.5, 1.5}}
railloadingyard.picture = {
	layers =
	{
		copyData("container","wooden-chest","picture"),
		copyData("container","wooden-chest","picture"),
		copyData("container","wooden-chest","picture"),
		copyData("container","wooden-chest","picture"),
		copyData("container","wooden-chest","picture"),
		copyData("container","wooden-chest","picture")
	}
}
local currentIndex = 1
railloadingyard.picture.layers[currentIndex].shift[1] = railloadingyard.picture.layers[currentIndex].shift[1]-0.4+0.2
railloadingyard.picture.layers[currentIndex].shift[2] = railloadingyard.picture.layers[currentIndex].shift[2]-0.4-0.6
currentIndex=currentIndex+1
railloadingyard.picture.layers[currentIndex].shift[1] = railloadingyard.picture.layers[currentIndex].shift[1]-0.3-0.3
railloadingyard.picture.layers[currentIndex].shift[2] = railloadingyard.picture.layers[currentIndex].shift[2]+0.2-0.5
currentIndex=currentIndex+1
railloadingyard.picture.layers[currentIndex].shift[1] = railloadingyard.picture.layers[currentIndex].shift[1]+0.58-0.3
railloadingyard.picture.layers[currentIndex].shift[2] = railloadingyard.picture.layers[currentIndex].shift[2]+0.1-0.5
currentIndex=currentIndex+1
railloadingyard.picture.layers[currentIndex].shift[1] = railloadingyard.picture.layers[currentIndex].shift[1]+0.4-0.9
railloadingyard.picture.layers[currentIndex].shift[2] = railloadingyard.picture.layers[currentIndex].shift[2]    +0.6
currentIndex=currentIndex+1
railloadingyard.picture.layers[currentIndex].shift[1] = railloadingyard.picture.layers[currentIndex].shift[1]+0.4+0.38
railloadingyard.picture.layers[currentIndex].shift[2] = railloadingyard.picture.layers[currentIndex].shift[2]    +0.1

currentIndex=currentIndex+1
railloadingyard.picture.layers[currentIndex].hr_version = copyData("container","wooden-chest","picture")
railloadingyard.picture.layers[currentIndex].filename = "__ThalStorage__/graphics/entity/rail_loading_yard.png"
railloadingyard.picture.layers[currentIndex].width    = 192
railloadingyard.picture.layers[currentIndex].height   = 192
railloadingyard.picture.layers[currentIndex].scale    = 0.5
railloadingyard.picture.layers[currentIndex].shift    = nil
railloadingyard.picture.layers[currentIndex].draw_as_shadow = true
railloadingyard.picture.layers[currentIndex].hr_version.filename = "__ThalStorage__/graphics/entity/rail_loading_yard_hr.png"
railloadingyard.picture.layers[currentIndex].hr_version.width    = 384
railloadingyard.picture.layers[currentIndex].hr_version.height   = 384
railloadingyard.picture.layers[currentIndex].hr_version.scale    = 0.25
railloadingyard.picture.layers[currentIndex].hr_version.shift    = nil
railloadingyard.picture.layers[currentIndex].hr_version.draw_as_shadow = true
railloadingyard.circuit_wire_connection_point = circuit_connector_definitions["assembling-machine"].points
railloadingyard.circuit_connector_sprites = circuit_connector_definitions["assembling-machine"].sprites

local railloadingyard2x2 = makeNewEntityFromData("container","wooden-chest","rail-loading-yard2x2")
railloadingyard2x2.inventory_size = 19
railloadingyard2x2.collision_box  = {{-0.75, -0.75}, {0.75, 0.75}}
railloadingyard2x2.selection_box  = {{-1.0, -1.0}, {1.0, 1.0}}
railloadingyard2x2.picture = {
	layers =
	{
		copyData("container","wooden-chest","picture"),
		copyData("container","wooden-chest","picture"),
		copyData("container","wooden-chest","picture"),
		copyData("container","wooden-chest","picture")
	}
}
currentIndex = 1
railloadingyard2x2.picture.layers[currentIndex].shift[1] = railloadingyard2x2.picture.layers[currentIndex].shift[1]-0.2
railloadingyard2x2.picture.layers[currentIndex].shift[2] = railloadingyard2x2.picture.layers[currentIndex].shift[2]-0.4
currentIndex=currentIndex+1
railloadingyard2x2.picture.layers[currentIndex].shift[1] = railloadingyard2x2.picture.layers[currentIndex].shift[1]-0.4
railloadingyard2x2.picture.layers[currentIndex].shift[2] = railloadingyard2x2.picture.layers[currentIndex].shift[2]+0.3
currentIndex=currentIndex+1
railloadingyard2x2.picture.layers[currentIndex].shift[1] = railloadingyard2x2.picture.layers[currentIndex].shift[1]+0.45
railloadingyard2x2.picture.layers[currentIndex].shift[2] = railloadingyard2x2.picture.layers[currentIndex].shift[2]+0.2

currentIndex=currentIndex+1
railloadingyard2x2.picture.layers[currentIndex].hr_version = copyData("container","wooden-chest","picture")
railloadingyard2x2.picture.layers[currentIndex].filename = "__ThalStorage__/graphics/entity/rail_loading_yard.png"
railloadingyard2x2.picture.layers[currentIndex].width    = 192
railloadingyard2x2.picture.layers[currentIndex].height   = 192
railloadingyard2x2.picture.layers[currentIndex].scale    = 0.3333
railloadingyard2x2.picture.layers[currentIndex].shift    = nil
railloadingyard2x2.picture.layers[currentIndex].draw_as_shadow = true
railloadingyard2x2.picture.layers[currentIndex].hr_version.filename = "__ThalStorage__/graphics/entity/rail_loading_yard_hr.png"
railloadingyard2x2.picture.layers[currentIndex].hr_version.width    = 384
railloadingyard2x2.picture.layers[currentIndex].hr_version.height   = 384
railloadingyard2x2.picture.layers[currentIndex].hr_version.scale    = 0.1666
railloadingyard2x2.picture.layers[currentIndex].hr_version.shift    = nil
railloadingyard2x2.picture.layers[currentIndex].hr_version.draw_as_shadow = true
railloadingyard2x2.circuit_wire_connection_point = circuit_connector_definitions["assembling-machine"].points
railloadingyard2x2.circuit_connector_sprites = circuit_connector_definitions["assembling-machine"].sprites

----------
-- Item --
----------
local railloadingyard_item = makeNewItemFromData("item","wooden-chest","rail-loading-yard")
railloadingyard_item.stack_size = 10
railloadingyard_item.icon       = "__ThalStorage__/graphics/icons/rail_loading_yard_icon.png"
railloadingyard_item.icon_size   = 64

local railloadingyard2x2_item = makeNewItemFromData("item","wooden-chest","rail-loading-yard2x2")
railloadingyard2x2_item.stack_size = 10
railloadingyard2x2_item.icon       = "__ThalStorage__/graphics/icons/rail_loading_yard_icon.png"
railloadingyard2x2_item.icon_size   = 64

--------------
-- Database --
--------------
data:extend({
	railloadingyard,
	railloadingyard_item,
	{
		type = "recipe",
		name = "rail-loading-yard",
		energy_required = 1,
		enabled = true,
		ingredients =
		{
			{name="wooden-chest", amount=3},
		},
		result= "rail-loading-yard"
	},
	railloadingyard2x2,
	railloadingyard2x2_item,
	{
		type = "recipe",
		name = "rail-loading-yard2x2",
		energy_required = 1,
		enabled = true,
		ingredients =
		{
			{name="wooden-chest", amount=2},
		},
		result= "rail-loading-yard2x2"
	},
})