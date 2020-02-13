data:extend(
{
	{
		type = "recipe",
		name = "recycle-stone-furnace",
		category = "advanced-crafting",
		subgroup = "recycle-furnaces",
		icon = "__base__/graphics/icons/stone-furnace.png",
		icon_size = 32,
		order = "a",
		ingredients =
		{
			{type="item", name="stone-furnace", amount=1}
		},
		results=
		{
			{type="item", name="stone", amount=5},
		},
		energy_required = 1,
		enabled = true
	},
	{
		type = "recipe",
		name = "recycle-steel-furnace",
		category = "advanced-crafting",
		subgroup = "recycle-furnaces",
		icon = "__base__/graphics/icons/steel-furnace.png",
		icon_size = 32,
		order = "b",
		ingredients =
		{
			{type="item", name="steel-furnace", amount=1}
		},
		results=
		{
			{type="item", name="steel-plate", amount=6},
			{type="item", name="stone-brick", amount=10}
		},
		energy_required = 1,
		enabled = true
	},
	{
		type = "recipe",
		name = "recycle-wooden-chest",
		category = "advanced-crafting",
		subgroup = "recycle-chests",
		icon = "__base__/graphics/icons/wooden-chest.png",
		icon_size = 32,
		order = "a",
		ingredients =
		{
			{type="item", name="wooden-chest", amount=1}
		},
		results=
		{
			{type="item", name="wood", amount=4}
		},
		energy_required = 1,
		enabled = true
	},
	{
		type = "recipe",
		name = "recycle-iron-chest",
		category = "advanced-crafting",
		subgroup = "recycle-chests",
		icon = "__base__/graphics/icons/iron-chest.png",
		icon_size = 32,
		order = "b",
		ingredients =
		{
			{type="item", name="iron-chest", amount=1}
		},
		results=
		{
			{type="item", name="iron-plate", amount=8}
		},
		energy_required = 1,
		enabled = true
	},
	{
		type = "recipe",
		name = "recycle-burner-inserter",
		category = "advanced-crafting",
		subgroup = "recycle-drills",
		icon = "__base__/graphics/icons/burner-inserter.png",
		icon_size = 32,
		order = "i",
		ingredients =
		{
			{type="item", name="burner-inserter", amount=1}
		},
		results=
		{
			{type="item", name="iron-plate", amount=1},
			{type="item", name="iron-gear-wheel", amount=1}
		},
		energy_required = 1,
		enabled = true
	},
	{
		type = "recipe",
		name = "recycle-burner-mining-drill",
		category = "advanced-crafting",
		subgroup = "recycle-drills",
		icon = "__base__/graphics/icons/burner-mining-drill.png",
		icon_size = 32,
		order = "m",
		normal =
		{
			energy_required = 1,
			ingredients =
			{
				{type="item", name="burner-mining-drill", amount=1}
			},
			results=
			{
				{type="item", name="iron-gear-wheel", amount=3},
				{type="item", name="stone-furnace", amount=1},
				{type="item", name="iron-plate", amount=3}
			}
		},
		expensive = 
		{
			energy_required = 1,
			ingredients =
			{
				{type="item", name="burner-mining-drill", amount=1}
			},
			results=
			{
				{type="item", name="iron-gear-wheel", amount=6},
				{type="item", name="stone-furnace", amount=2},
				{type="item", name="iron-plate", amount=6}
			}
		},
		enabled = true
	},
	{
		type = "recipe",
		name = "recycle-steam-engine",
		category = "advanced-crafting",
		subgroup = "recycle-drills",
		icon = "__base__/graphics/icons/steam-engine.png",
		icon_size = 32,
		order = "s",
		normal =
		{
			energy_required = 1,
			ingredients =
			{
				{type="item", name="steam-engine", amount=1}
			},
			results =
			{
				{type="item", name="iron-gear-wheel", amount=8},
				{type="item", name="pipe", amount=5},
				{type="item", name="iron-plate", amount=10},
			},
		},
		expensive =
		{
			energy_required = 1,
			ingredients =
			{
				{type="item", name="steam-engine", amount=1}
			},
			results =
			{
				{type="item", name="iron-gear-wheel", amount=10},
				{type="item", name="pipe", amount=5},
				{type="item", name="iron-plate", amount=50},
			},
		},
		enabled = true,
	},
	{
		type = "recipe",
		name = "recycle-pistol",
		category = "advanced-crafting",
		subgroup = "recycle-military",
		icon = "__base__/graphics/icons/pistol.png",
		icon_size = 32,
		order = "a",
		ingredients =
		{
			{type="item", name="pistol", amount=1}
		},
		results=
		{
			{type="item", name="copper-plate", amount=5},
			{type="item", name="iron-plate", amount=5}
		},
		energy_required = 1,
		enabled = true
	},
	{
		type = "recipe",
		name = "recycle-shotgun",
		category = "advanced-crafting",
		subgroup = "recycle-military",
		icon = "__base__/graphics/icons/shotgun.png",
		icon_size = 32,
		order = "b",
		ingredients =
		{
			{type="item", name="shotgun", amount=1}
		},
		results=
		{
			{type="item", name="iron-plate", amount=15},
			{type="item", name="iron-gear-wheel", amount=5},
			{type="item", name="copper-plate", amount=10},
			{type="item", name="wood", amount=6}
		},
		energy_required = 1,
		enabled = true
	},
	{
		type = "recipe",
		name = "recycle-light-armor",
		category = "advanced-crafting",
		subgroup = "recycle-military",
		icon = "__base__/graphics/icons/light-armor.png",
		icon_size = 32,
		order = "c",
		ingredients =
		{
			{type="item", name="light-armor", amount=1}
		},
		results=
		{
			{type="item", name="iron-plate", amount=40}
		},
		energy_required = 1,
		enabled = true
	},
	{
		type = "recipe",
		name = "recycle-heavy-armor",
		category = "advanced-crafting",
		subgroup = "recycle-military",
		icon = "__base__/graphics/icons/heavy-armor.png",
		icon_size = 32,
		order = "d",
		ingredients =
		{
			{type="item", name="heavy-armor", amount=1}
		},
		results=
		{
			{type="item", name="copper-plate", amount=100},
			{type="item", name="steel-plate", amount=50}
		},
		energy_required = 1,
		enabled = true
	},
	{
		type = "recipe",
		name = "recycle-solar-panel-equipment",
		category = "advanced-crafting",
		subgroup = "recycle-military-equipment",
		icon = "__base__/graphics/icons/solar-panel-equipment.png",
		icon_size = 32,
		order = "a",
		ingredients =
		{
			{type="item", name="solar-panel-equipment", amount=1}
		},
		results=
		{
			{"solar-panel", 2},
			{"advanced-circuit", 1},
			{"steel-plate", 5}
		},
		energy_required = 10,
		enabled = true
	},
	--[[
	{
		type = "recipe",
		name = "recycle-iron-axe",
		category = "advanced-crafting",
		subgroup = "recycle-misc",
		icon = "__base__/graphics/icons/iron-axe.png",
		icon_size = 32,
		order = "a",
		ingredients =
		{
			{type="item", name="iron-axe", amount=1}
		},
		results=
		{
			{type="item", name="iron-stick", amount=2},
			{type="item", name="iron-plate", amount=3}
		},
		energy_required = 1,
		enabled = true
	},
	--]]
	{
		type = "recipe",
		name = "recycle-small-electric-pole",
		category = "advanced-crafting",
		subgroup = "recycle-misc",
		icon = "__base__/graphics/icons/small-electric-pole.png",
		icon_size = 32,
		order = "b",
		ingredients =
		{
			{type="item", name="small-electric-pole", amount=1}
		},
		results=
		{
			{type="item", name="wood", amount=1},
			{type="item", name="copper-cable", amount=1}
		},
		energy_required = 1,
		enabled = true
	}
}
)