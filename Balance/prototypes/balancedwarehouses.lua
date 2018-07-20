local collision  = {{-2.7, -2.2}, {2.7, 2.2}}
local selection  = {{-3.0, -2.5}, {3.0, 2.5}}
local imageshift = {1.0, -0.8}



-------------
--- ITEMS ---
-------------

local entityList = {}

entityList["storehouse-basic"]			= "container"
entityList["storehouse-passive-provider"]= "logistic-container"
entityList["storehouse-active-provider"]	= "logistic-container"
entityList["storehouse-storage"]			= "logistic-container"
entityList["storehouse-requester"]		= "logistic-container"

for k,v in pairs(entityList) do
	data.raw[v][k].inventory_size = 288
	data.raw[v][k].max_health = 500
end

entityList = {}

entityList["warehouse-basic"]			= "container"
entityList["warehouse-passive-provider"]= "logistic-container"
entityList["warehouse-active-provider"]	= "logistic-container"
entityList["warehouse-storage"]			= "logistic-container"
entityList["warehouse-requester"]		= "logistic-container"

for k,v in pairs(entityList) do
	data.raw[v][k].inventory_size = 768
	data.raw[v][k].max_health = 1000
	data.raw[v][k].collision_box = collision
	data.raw[v][k].selection_box = selection
	data.raw[v][k].picture.shift = imageshift
end

entityList = {}

data.raw["container"]["storehouse-basic"].max_wire_distance = 9
data.raw["container"]["storehouse-basic"].circuit_wire_max_distance = 9
data.raw["container"]["storehouse-basic"].supply_area_distance = 80
data.raw["container"]["storehouse-basic"].circuit_wire_connection_point = {
	shadow =
	{
		copper = {1.0, 0.95},
		green = {1.0, 1.15},
		red = {1.0, 0.95}
	},
	wire =
	{
		copper = {1.0, 0.95},
		green = {1.0, 1.15},
		red = {1.0, 0.95}
	}
}
data.raw["container"]["storehouse-basic"].radius_visualisation_picture = {
	filename = "__base__/graphics/entity/small-electric-pole/electric-pole-radius-visualization.png",
	width = 40,
	height = 40,
	priority = "extra-high-no-scale"
}
--data.raw["container"]["storehouse-basic"].circuit_connector_sprites = get_circuit_connector_sprites({0.8, 0.9}, nil, 18)



--------------
-- RECIPIES --
--------------

data.raw["recipe"]["storehouse-basic"].expensive = {
	enabled = false,
	ingredients = {
		{"steel-chest",6},
		{"fast-inserter",6},
		{"stone-brick",9},
		{"wood",20},
	},
	result = "storehouse-basic",
	requester_paste_multiplier = 4
}

data.raw["recipe"]["storehouse-passive-provider"].expensive = {
	enabled = false,
	ingredients = {
		{"logistic-chest-passive-provider",6},
		{"fast-inserter",6},
		{"stone-brick",9},
		{"wood",20},
	},
	result = "storehouse-passive-provider",
	requester_paste_multiplier = 4
}

data.raw["recipe"]["storehouse-active-provider"].expensive = {
	enabled = false,
	ingredients = {
		{"logistic-chest-active-provider",6},
		{"fast-inserter",6},
		{"stone-brick",9},
		{"wood",20},
	},
	result = "storehouse-active-provider",
	requester_paste_multiplier = 4
}

data.raw["recipe"]["storehouse-storage"].expensive = {
	enabled = false,
	ingredients = {
		{"logistic-chest-storage",6},
		{"fast-inserter",6},
		{"stone-brick",9},
		{"wood",20},
	},
	result = "storehouse-storage",
	requester_paste_multiplier = 4
}

data.raw["recipe"]["storehouse-requester"].expensive = {
	enabled = false,
	ingredients = {		{"logistic-chest-requester",6},
		{"fast-inserter",6},
		{"stone-brick",9},
		{"wood",20},

	},
	result = "storehouse-requester",
	requester_paste_multiplier = 4
}



data.raw["recipe"]["warehouse-basic"].expensive = {
	enabled = false,
	ingredients = {
		{"steel-chest",16},
		{"fast-inserter",16},
		{"stone-brick",20},
		{"wood",60},
	},
	result = "warehouse-basic",
	requester_paste_multiplier = 4
}

data.raw["recipe"]["warehouse-passive-provider"].expensive = {
	enabled = false,
	ingredients = {
		{"logistic-chest-passive-provider",16},
		{"fast-inserter",16},
		{"stone-brick",20},
		{"wood",60},
	},
	result = "warehouse-passive-provider",
	requester_paste_multiplier = 4
}

data.raw["recipe"]["warehouse-active-provider"].expensive = {
	enabled = false,
	ingredients = {
		{"logistic-chest-active-provider",16},
		{"fast-inserter",16},
		{"stone-brick",20},
		{"wood",60},
	},
	result = "warehouse-active-provider",
	requester_paste_multiplier = 4
}

data.raw["recipe"]["warehouse-storage"].expensive = {
	enabled = false,
	ingredients = {
		{"logistic-chest-storage",16},
		{"fast-inserter",16},
		{"stone-brick",20},
		{"wood",60},
	},
	result = "warehouse-storage",
	requester_paste_multiplier = 4
}

data.raw["recipe"]["warehouse-requester"].expensive = {
	enabled = false,
	ingredients = {
		{"logistic-chest-requester",16},
		{"fast-inserter",16},
		{"stone-brick",20},
		{"wood",60},
	},
	result = "warehouse-requester",
	requester_paste_multiplier = 4
}



-------------
--- TECHS ---
-------------

data.raw["technology"]["warehouse-research"].effects = { 
	{
		type = "unlock-recipe",
		recipe = "storehouse-basic",
	},
	{
		type = "unlock-recipe",
		recipe = "warehouse-basic",
	},
	{
		type = "unlock-recipe",
		recipe = "rail-loading-yard",
	},
}

data:extend({
	{
		type = "technology",
		name = "warehouse-robotics",
		icon = "__Warehousing__/graphics/research/warehouse-logistics-research.png",
		icon_size = 128,
		effects = {
			{
				type = "unlock-recipe",
				recipe = "storehouse-passive-provider",
			},
			{
				type = "unlock-recipe",
				recipe = "storehouse-storage",
			},
			{
				type = "unlock-recipe",
				recipe = "warehouse-passive-provider",
			},
			{
				type = "unlock-recipe",
				recipe = "warehouse-storage",
			},
		},
		prerequisites = {"warehouse-research", "robotics", "flying"},
		unit = {
			count = 100,
			ingredients = {
				{"science-pack-1", 1},
				{"science-pack-2", 1}
			},
			time = 30
		},
		order = "c-k-a",
	},
})

data.raw["technology"]["warehouse-logistics-research"].prerequisites = { "warehouse-robotics", "logistic-system" }
data.raw["technology"]["warehouse-logistics-research"].effects = { 
	{
		type = "unlock-recipe",
		recipe = "storehouse-active-provider",
	},
	{
		type = "unlock-recipe",
		recipe = "storehouse-requester",
	},
	{
		type = "unlock-recipe",
		recipe = "warehouse-active-provider",
	},
	{
		type = "unlock-recipe",
		recipe = "warehouse-requester",
	},
}