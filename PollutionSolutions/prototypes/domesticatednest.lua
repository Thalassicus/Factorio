require "util"
require "constants"

------------
-- Entity --
------------
local domesticatednest						= makeNewEntityFromData("assembling-machine","assembling-machine-2","domesticated-nest")
domesticatednest.crafting_categories		= {"alien-crafting"}
domesticatednest.ingredient_count			= 4
domesticatednest.energy_source.emissions	= 0
domesticatednest.module_specification.module_slots = 4
domesticatednest.fluid_boxes[1].pipe_connections[1].position = {-0,-3}
domesticatednest.fluid_boxes[2].pipe_connections[1].position = {-0,-3}
--domesticatednest.fluid_boxes[3] = util.table.deepcopy(domesticatednest.fluid_boxes[1])
--domesticatednest.fluid_boxes[4] = util.table.deepcopy(domesticatednest.fluid_boxes[2])
--domesticatednest.fluid_boxes[3].pipe_connections[1].position = {-1.5,-3}
--domesticatednest.fluid_boxes[4].pipe_connections[1].position = {-2.5,-3}
domesticatednest.corpse						= copyData("unit-spawner","biter-spawner","corpse")
domesticatednest.dying_explosion			= copyData("unit-spawner","biter-spawner","dying_explosion")
domesticatednest.collision_box				= {{-2.2, -2.2}, {2.2, 2.2}}
domesticatednest.selection_box				= {{-2.5, -2.5}, {2.5, 2.5}}
domesticatednest.max_health					= copyData("unit-spawner","biter-spawner","max_health")
domesticatednest.open_sound.filename		= copyData("unit-spawner","biter-spawner",{"dying_sound",1,"filename"})
domesticatednest.close_sound.filename		= copyData("unit-spawner","biter-spawner",{"dying_sound",2,"filename"})
domesticatednest.working_sound.sound		= copyData("unit-spawner","biter-spawner",{"working_sound","sound"})
domesticatednest.animation					= copyData("unit-spawner","biter-spawner",{"animations",1})
domesticatednest.icon						= copyData("unit-spawner","biter-spawner","icon")
domesticatednest.icon_size					= copyData("unit-spawner","biter-spawner","icon_size")
domesticatednest.animation.layers[1].shift	= {0,0}
domesticatednest.animation.layers[2].shift	= {0,0}
domesticatednest.animation.layers[1].animation_speed = 0.36
domesticatednest.animation.layers[2].animation_speed = 0.36
domesticatednest.animation.layers[2].tint	= copyData("fluid","toxic-sludge","flow_color")


----------
-- Item --
----------
local domesticatednest_item			= makeNewItemFromData("assembling-machine-2","domesticated-nest")
domesticatednest_item.icon			= copyData("unit-spawner","biter-spawner",{"icon"})
domesticatednest_item.icon_size		= copyData("unit-spawner","biter-spawner",{"icon_size"})
domesticatednest_item.order			= "d[domesticated-nest]"
domesticatednest_item.stack_size	= 50


------------
-- Extend --
------------
data:extend({
	{
		type = "recipe-category",
		name = "alien-crafting"
	},
	domesticatednest,
	domesticatednest_item,
	{
		type = "recipe",
		name = "domesticated-nest",
		energy_required = 10,
		enabled = false,
		ingredients =
		{
			{type="item", name="red-xenomass",			amount=10},
			{type="item", name="advanced-circuit",	amount=5},
			{type="item", name="pump",				amount=2},
		},
		result= "domesticated-nest"
	},
	{
		type = "recipe",
		name = "nest-pollution-blue-xenomass",
		category = "alien-crafting",
		enabled = false,
		energy_required = 30,
		ingredients = 
		{
			{type="fluid", name=POLLUTED_AIR_NAME, amount=POLLUTION_PER_BLUE_XENOMASS },
		},
		results=
		{
			{type="item", name="blue-xenomass", amount=1},
		},
		main_product= "",
		icon = "__PollutionSolutions__/graphics/icons/blue-xenomass.png",
		icon_size = 64,
		subgroup = "fluid-recipes",
		order = "z",
		crafting_machine_tint =
		{
			primary = {r = 0.290, g = 0.027, b = 0.000, a = 0.000}, -- #49060000
			secondary = {r = 0.722, g = 0.465, b = 0.190, a = 0.000}, -- #b8763000
			tertiary = {r = 0.870, g = 0.365, b = 0.000, a = 0.000}, -- #dd5d0000
		}
	},
	{
		type = "recipe",
		name = "nest-sludge-red-xenomass",
		category = "alien-crafting",
		enabled = false,
		energy_required = 30,
		ingredients = 
		{
			{type="fluid", name=TOXIC_SLUDGE_NAME, amount=SLUDGE_PER_RED_XENOMASS },
		},
		results=
		{
			{type="item", name="red-xenomass", amount=1},
		},
		main_product= "",
		icon = "__PollutionSolutions__/graphics/icons/red-xenomass.png",
		icon_size = 64,
		subgroup = "fluid-recipes",
		order = "z",
		crafting_machine_tint =
		{
			primary = {r = 0.290, g = 0.027, b = 0.000, a = 0.000}, -- #49060000
			secondary = {r = 0.722, g = 0.465, b = 0.190, a = 0.000}, -- #b8763000
			tertiary = {r = 0.870, g = 0.365, b = 0.000, a = 0.000}, -- #dd5d0000
		}
	}
})
