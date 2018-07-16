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
railloadingyard.picture.layers[currentIndex].filename = "__MiscMods__/graphics/entity/rail_loading_yard.png"
railloadingyard.picture.layers[currentIndex].width    = 192
railloadingyard.picture.layers[currentIndex].height   = 192
railloadingyard.picture.layers[currentIndex].scale    = 0.5
railloadingyard.picture.layers[currentIndex].shift    = nil
railloadingyard.picture.layers[currentIndex].draw_as_shadow = true
railloadingyard.picture.layers[currentIndex].hr_version.filename = "__MiscMods__/graphics/entity/rail_loading_yard_hr.png"
railloadingyard.picture.layers[currentIndex].hr_version.width    = 384
railloadingyard.picture.layers[currentIndex].hr_version.height   = 384
railloadingyard.picture.layers[currentIndex].hr_version.scale    = 0.25
railloadingyard.picture.layers[currentIndex].hr_version.shift    = nil
railloadingyard.picture.layers[currentIndex].hr_version.draw_as_shadow = true
railloadingyard.circuit_wire_connection_point = circuit_connector_definitions["assembling-machine"].points
railloadingyard.circuit_connector_sprites = circuit_connector_definitions["assembling-machine"].sprites
--[[



local railstationchest_h6 = makeNewEntityFromData("container","wooden-chest","rail-chest-h-full")
railstationchest_h6.inventory_size = 60
railstationchest_h6.collision_box  = {{-2.85, -0.35}, {2.85, 0.35}}
railstationchest_h6.selection_box  = {{-3.0, -0.5}, {3.0, 0.5}}
railstationchest_h6.picture = {
	layers =
	{
		copyData("container","wooden-chest","picture")
	}
}
railstationchest_h6.picture.layers[1].filename = "__MiscMods__/graphics/entity/rail_chest_h6.png"
railstationchest_h6.picture.layers[1].width = 208
railstationchest_h6.picture.layers[1].shift[1] = railstationchest_h6.picture.layers[1].shift[1] + 0.05


local railstationchest_h3 = makeNewEntityFromData("container","wooden-chest","rail-chest-h-half")
railstationchest_h3.inventory_size = 30
railstationchest_h3.collision_box  = {{-1.35, -0.35}, {1.35, 0.35}}
railstationchest_h3.selection_box  = {{-1.5, -0.5}, {1.5, 0.5}}
railstationchest_h3.picture = {
	layers =
	{
		copyData("container","wooden-chest","picture")
	}
}
railstationchest_h3.picture.layers[1].filename = "__MiscMods__/graphics/entity/rail_chest_h3.png"
railstationchest_h3.picture.layers[1].width = 118
railstationchest_h3.picture.layers[1].shift[1] = railstationchest_h3.picture.layers[1].shift[1] + 0.05
railstationchest_h3.picture.layers[1].scale = 0.9

local railstationchest_v6 = makeNewEntityFromData("container","wooden-chest","rail-chest-v-full")
railstationchest_v6.inventory_size = 60
railstationchest_v6.collision_box  = {{-0.35, -2.85}, {0.35, 2.85}}
railstationchest_v6.selection_box  = {{-0.5, -3.0}, {0.5, 3.0}}
railstationchest_v6.picture = {
	layers =
	{
		copyData("container","wooden-chest","picture")
	}
}
railstationchest_v6.picture.layers[1].filename = "__MiscMods__/graphics/entity/rail_chest_v6.png"
railstationchest_v6.picture.layers[1].height = 187

local railstationchest_v3 = makeNewEntityFromData("container","wooden-chest","rail-chest-v-half")
railstationchest_v3.inventory_size = 30
railstationchest_v3.collision_box  = {{-0.35, -1.35}, {0.35, 1.35}}
railstationchest_v3.selection_box  = {{-0.5, -1.5}, {0.5, 1.5}}
railstationchest_v3.picture = {
	layers =
	{
		copyData("container","wooden-chest","picture")
	}
}
railstationchest_v3.picture.layers[1].filename = "__MiscMods__/graphics/entity/rail_chest_v3.png"
railstationchest_v3.picture.layers[1].height = 103
railstationchest_v3.picture.layers[1].scale = 0.9
--]]


----------
-- Item --
----------
local railloadingyard_item = makeNewItemFromData("item","wooden-chest","rail-loading-yard")
railloadingyard_item.stack_size = 10
railloadingyard_item.icon       = "__MiscMods__/graphics/icons/rail_loading_yard_icon.png"
railloadingyard_item.icon_size   = 64
--[[
local railstationchest_h6_item = makeNewItemFromData("item","wooden-chest","rail-chest-h-full")
railstationchest_h6_item.stack_size = 10

local railstationchest_h3_item = makeNewItemFromData("item","wooden-chest","rail-chest-h-half")
railstationchest_h3_item.stack_size = 10

local railstationchest_v6_item = makeNewItemFromData("item","wooden-chest","rail-chest-v-full")
railstationchest_v6_item.stack_size = 10

local railstationchest_v3_item = makeNewItemFromData("item","wooden-chest","rail-chest-v-half")
railstationchest_v3_item.stack_size = 10
--]]

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
--[[
	
	railstationchest_h6,
	railstationchest_h6_item,
	{
		type = "recipe",
		name = "rail-chest-h-full",
		energy_required = 5,
		enabled = true,
		ingredients =
		{
			{name="wooden-chest", amount=6},
		},
		result= "rail-chest-h-full"
	},
	railstationchest_h3,
	railstationchest_h3_item,
	{
		type = "recipe",
		name = "rail-chest-h-half",
		energy_required = 2.5,
		enabled = true,
		ingredients =
		{
			{name="wooden-chest", amount=3},
		},
		result= "rail-chest-h-half"
	},
	
	railstationchest_v6,
	railstationchest_v6_item,
	{
		type = "recipe",
		name = "rail-chest-v-full",
		energy_required = 5,
		enabled = true,
		ingredients =
		{
			{name="wooden-chest", amount=6},
		},
		result= "rail-chest-v-full"
	},
	railstationchest_v3,
	railstationchest_v3_item,
	{
		type = "recipe",
		name = "rail-chest-v-half",
		energy_required = 2.5,
		enabled = true,
		ingredients =
		{
			{name="wooden-chest", amount=3},
		},
		result= "rail-chest-v-half"
	},
--]]
})