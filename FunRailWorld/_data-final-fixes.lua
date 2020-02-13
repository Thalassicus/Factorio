data.raw["map-gen-presets"]["default"]["fun-rail-world"] = {
	order = "1",
	basic_settings = {
		autoplace_controls = {
			["iron-ore"] = 		{ frequency = "very-low", 	size = "medium", 	richness = "high" },
			["copper-ore"] = 	{ frequency = "very-low", 	size = "medium", 	richness = "very-high" },
			["stone"] = 		{ frequency = "medium", 	size = "medium", 	richness = "medium" },
			["coal"] = 			{ frequency = "medium", 	size = "medium", 	richness = "medium" },
			["uranium-ore"] = 	{ frequency = "low", 		size = "small", 	richness = "high" },
			["crude-oil"] = 	{ frequency = "low", 		size = "high", 		richness = "low" },
			["grass"] = 		{ frequency = "medium", 	size = "medium" },
			["dirt"] = 			{ frequency = "medium", 	size = "medium" },
			["sand"] = 			{ frequency = "medium", 	size = "medium" },
			["desert"] = 		{ frequency = "medium", 	size = "medium" },
			["trees"] = 		{ frequency = "very-low", 	size = "very-high" },
			["enemy-base"] = 	{ frequency = "high", 		size = "medium", 	richness = "very-low" },
		},
		water = "medium",
		starting_area = "medium",
	},
	advanced_settings = {
		pollution =
		{
			diffusion_ratio = 0.10, -- 0.02
			min_pollution_to_damage_trees = 6000,		-- 3500
			pollution_with_max_forest_damage = 10000,	-- 10000
			max_pollution_to_restore_trees = 5000,		-- 1000
		},
		enemy_evolution =
		{
			time_factor = (1/60/60) / 24,			-- 70; last number is # hours to advance evolution by 1%
			destroy_factor = 0.01,
			pollution_factor = 0.1 / (100*1000),	-- 1.5; % evolution per 1000 pollution
		},
		enemy_expansion = 
		{
			max_expansion_distance = 5,			-- 7
			settler_group_min_size = 5,			-- 5
			settler_group_max_size = 10,		-- 20
			min_expansion_cooldown = 10 * 3600,	-- 4 * 3600
			max_expansion_cooldown = 20 * 3600,	-- 60 * 3600
		},
		difficulty_settings = {
			recipe_difficulty = defines.difficulty_settings.recipe_difficulty.expensive	,
			technology_difficulty = defines.difficulty_settings.recipe_difficulty.expensive	,
			technology_price_multiplier = 1
		},
	},
}
