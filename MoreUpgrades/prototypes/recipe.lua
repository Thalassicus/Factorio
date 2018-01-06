local tier2radar_recipe =  util.table.deepcopy(data.raw['recipe']['radar'])
tier2radar_recipe.name = "radar-outpost"
tier2radar_recipe.result = "radar-outpost"
tier2radar_recipe.enabled = true
tier2radar_recipe.ingredients = {
	{"radar", 1},
	{"iron-plate", 4},
	{"battery", 10},
	{"steel-plate", 15},
	{"electronic-circuit", 45},
	{"copper-plate", 15},
}

local circuitpipe_recipe =  util.table.deepcopy(data.raw['recipe']['pipe'])
circuitpipe_recipe.name = "circuit-pipe"
circuitpipe_recipe.normal.result = "circuit-pipe"
circuitpipe_recipe.expensive.result = "circuit-pipe"
circuitpipe_recipe.enabled = true

local bigwall_recipe =  util.table.deepcopy(data.raw['recipe']['stone-wall'])
bigwall_recipe.name = "big-stone-wall"
bigwall_recipe.result = "big-stone-wall"
bigwall_recipe.enabled = true
bigwall_recipe.ingredients = {
	{"stone-wall", 8},
	{"steel-plate", 6},
}

data:extend({
	tier2radar_recipe,
	bigwall_recipe,
	circuitpipe_recipe,
})