data:extend(
{
	{
		type = "technology",
		name = "pollution-controls",
		icon = data.raw['item']['chemical-plant'].icon,
		icon_size = 32,
		prerequisites = {"fluid-handling","engine"},
		unit =
		{
			count = 100,
			ingredients =
			{
				{"science-pack-1", 1},
				{"science-pack-2", 1}
			},
			time = 30
		},
		effects =
		{
			{
				type = "unlock-recipe",
				recipe = "airfilter"
			},
			{
				type = "unlock-recipe",
				recipe = "collect-pollution"
			},
			{
				type = "unlock-recipe",
				recipe = "toxic-turret"
			},
		},
		order = "c-a"
	},
})data:extend(
{
	{
		type = "technology",
		name = "inceneration",
		icon = "__PollutionControls__/graphics/icons/incinerator.png",
		icon_size = 32,
		prerequisites = {"pollution-controls", "flammables"},
		unit =
		{
			count = 100,
			ingredients =
			{
				{"science-pack-1", 1},
				{"science-pack-2", 1}
			},
			time = 30
		},
		effects =
		{
			{
				type = "unlock-recipe",
				recipe = "incinerator"
			},
			{
				type = "unlock-recipe",
				recipe = "low-heat-exchanger"
			},
			{
				type = "unlock-recipe",
				recipe = "heat-pipe"
			},
			{
				type = "unlock-recipe",
				recipe = "waste-treatment"
			},
			{
				type = "unlock-recipe",
				recipe = "emitter"
			}
		},
		order = "c-a"
	},
})
