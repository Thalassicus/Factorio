local incinerator_recipe = util.table.deepcopy(data.raw['recipe']['nuclear-reactor'])
incinerator_recipe.name = "incinerator"
incinerator_recipe.result = "incinerator"
incinerator_recipe.enabled = false
incinerator_recipe.ingredients =
{
	{"steel-plate", 15},
	{"iron-gear-wheel", 10},
	{"stone-brick", 10},
	{"electronic-circuit", 10},
	{"pipe", 10}
}

local toxicturret_recipe = util.table.deepcopy(data.raw['recipe']['flamethrower-turret'])
toxicturret_recipe.name = "toxic-turret"
toxicturret_recipe.result = "toxic-turret"
toxicturret_recipe.enabled = false


local lowheater_recipe = util.table.deepcopy(data.raw['recipe']['heat-exchanger'])
lowheater_recipe.name = "low-heat-exchanger"
lowheater_recipe.result = "low-heat-exchanger"
lowheater_recipe.enabled = false

local emitter_recipe = util.table.deepcopy(data.raw['recipe']['storage-tank'])
emitter_recipe.name = "emitter"
emitter_recipe.category = "crafting"
emitter_recipe.ingredients = nil
emitter_recipe.normal = {
	energy_required = 3,
	enabled = false,
	ingredients = {
		{type="item", name="pipe-to-ground", amount=4},
		{type="item", name="iron-axe", amount=1},
	},
	result = "emitter"
}
emitter_recipe.expensive = {
	energy_required = 6,
	enabled = false,
	ingredients = {
		{type="item", name="pipe-to-ground", amount=4},
		{type="item", name="steel-axe", amount=1},
	},
	result = "emitter"
}

data:extend({
	incinerator_recipe,
	toxicturret_recipe,
	lowheater_recipe,
	emitter_recipe,
	{
		type = "recipe",
		name = "airfilter",
		energy_required = 5,
		enabled = false,
		ingredients =
		{
			{name="xenovasi",			amount=5},
			{name="steel-plate",		amount=5},
			{name="iron-gear-wheel",	amount=5},
			{name="electronic-circuit",	amount=5},
			{name="pipe", 				amount=5},
		},
		result= "airfilter"
	},
	{
		type = "recipe",
		name = "collect-pollution",
		category = "pollution",
		enabled = false,
		energy_required = 2,
		ingredients = 
		{
			{name="xenomeros", amount=1},
			{type="fluid", name="polluted-air", amount=500},
		},
		results=
		{
			{type="fluid", name="toxicsludge", amount=50},
		},
		main_product= "",
		icon = "__PollutionControls__/graphics/icons/fluid/toxicsludge.png",
		icon_size = 32,
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
		name = "waste-treatment",
		category = "chemistry",
		energy_required = 5,
		enabled = false,
		ingredients =
		{
			{type="fluid", name="toxicsludge", amount=1000},
		},
		results=
		{
			{type="fluid", name="steam", amount=50},
			{type="item", name="coal", amount=10},
			{type="fluid", name="heavy-oil", amount=25},
		},
		icon = "__base__/graphics/icons/fluid/coal-liquefaction.png",
		icon_size = 32,
		subgroup = "fluid-recipes",
		order = "a[oil-processing]-c[coal-liquefaction]",
		allow_decomposition = false,
		crafting_machine_tint =
		{
			primary = {r = 0.875, g = 0.735, b = 0.000, a = 0.000}, -- #dfbb0000
			secondary = {r = 0.103, g = 0.940, b = 0.000, a = 0.000}, -- #1aef0000
			tertiary = {r = 0.564, g = 0.795, b = 0.000, a = 0.000}, -- #8fca0000
		}
	},
})
table.insert(data.raw["module"]["productivity-module"].limitation,"collect-pollution")
table.insert(data.raw["module"]["productivity-module-2"].limitation,"collect-pollution")
table.insert(data.raw["module"]["productivity-module-3"].limitation,"collect-pollution")
data.raw["module"]["effectivity-module"].limitation={"collect-pollution"}
data.raw["module"]["effectivity-module-2"].limitation={"collect-pollution"}
data.raw["module"]["effectivity-module-3"].limitation={"collect-pollution"}
data.raw["module"]["effectivity-module"].limitation_message_key = "efficiency-module-only-on-polluters"
data.raw["module"]["effectivity-module-2"].limitation_message_key = "efficiency-module-only-on-polluters"
data.raw["module"]["effectivity-module-3"].limitation_message_key = "efficiency-module-only-on-polluters"