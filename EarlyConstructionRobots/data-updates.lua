for _, tech in pairs(data.raw["technology"]) do
	if tech.prerequisites then
		for index, prereq in pairs(tech.prerequisites) do
			if prereq == "construction-robotics" then
				data.raw["technology"][tech.name].prerequisites[index] = "robotics"
			end
		end
	end
end

data.raw["technology"]["robotics"].effects = {
	{
		type = "unlock-recipe",
		recipe = "roboport"
	},
	{
		type = "unlock-recipe",
		recipe = "logistic-chest-passive-provider"
	},
	{
		type = "unlock-recipe",
		recipe = "logistic-chest-storage"
	},
	{
		type = "ghost-time-to-live",
		modifier = 60 * 60 * 60 * 24 * 7
	},
}
data.raw["technology"]["logistic-robotics"].effects =
{
	{
		type = "unlock-recipe",
		recipe = "flying-robot-frame"
	},
	{
		type = "unlock-recipe",
		recipe = "logistic-robot"
	},
}

data.raw["technology"]["robotics"].icon = "__EarlyConstructionRobots__/graphics/roboports.png"
data.raw["recipe"]["construction-robot"].ingredients =
{
	{"engine-unit", 1},
	{"inserter", 1},
	{"electronic-circuit", 10},
	{"steel-plate", 2},
}


--
-- Technology
--


data.raw["technology"]["construction-robotics"] =
{
	type = "technology",
	name = "construction-robotics",
	icon = "__base__/graphics/technology/construction-robotics.png",
	icon_size = 128,
	prerequisites = {"engine"},
	unit =
	{
		count = 100,
		ingredients =
		{
			{"automation-science-pack", 1},
			{"logistic-science-pack", 1}
		},
		time = 30
	},
	effects =
	{
		{
			type = "unlock-recipe",
			recipe = "robot-pack"
		},
		{
			type = "unlock-recipe",
			recipe = "robotcharger-equipment"
		},
		{
			type = "unlock-recipe",
			recipe = "generator-equipment"
		},
		{
			type = "unlock-recipe",
			recipe = "construction-robot"
		},
	},
	order = "c-a"
}
data.raw["technology"]["robotics"].prerequisites = {"construction-robotics", "chemical-science-pack"}
data.raw["technology"]["logistic-robotics"].prerequisites = {"robotics", "electric-engine", "battery", }
data.raw["technology"]["utility-science-pack"].prerequisites = {"logistic-robotics", "advanced-electronics-2", "low-density-structure"}
