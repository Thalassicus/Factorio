data:extend(
{
	{
		type = "technology",
		name = "pollution-controls",
		icon = "__PollutionControls__/graphics/icons/pollution-collection.png",
		icon_size = 128,
		prerequisites = {"fluid-handling"},
		unit =
		{
			count = 100,
			ingredients =
			{
				{"science-pack-1", 1}
			},
			time = 30
		},
		effects =
		{
			{
				type = "unlock-recipe",
				recipe = "pollutioncollector"
			},
			{
				type = "unlock-recipe",
				recipe = "dump-site"
			},
			{
				type = "unlock-recipe",
				recipe = "hev-armor"
			}
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
		prerequisites = {"pollution-controls", "flammables","engine"},
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
				recipe = "xenomeros"
			},
			{
				type = "unlock-recipe",
				recipe = "liquify-pollution"
			},
			{
				type = "unlock-recipe",
				recipe = "toxic-turret"
			},
			{
				type = "unlock-recipe",
				recipe = "waste-treatment"
			},
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
				recipe = "domesticated-nest"
			},
			{
				type = "unlock-recipe",
				recipe = "nest-pollution-xenomeros"
			},
			{
				type = "unlock-recipe",
				recipe = "nest-sludge-xenovasi"
			},
		},
		order = "c-a"
	},
})
