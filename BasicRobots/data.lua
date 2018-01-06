--
-- Basic Robot
--

local basic_robot = util.table.deepcopy(data.raw['construction-robot']['construction-robot'])
basic_robot.name = "basic-construction-robot"
basic_robot.minable.result = "basic-construction-robot"
basic_robot.order = "z"
basic_robot.speed = 0.06
basic_robot.max_energy = "0.4MJ"
basic_robot.energy_per_tick = "0.04kJ"
basic_robot.speed_multiplier_when_out_of_energy = 0.75
basic_robot.energy_per_move = "4kJ"
data:extend({
    basic_robot
})

local basic_robot_item =  util.table.deepcopy(data.raw['item']['construction-robot'])
basic_robot_item.name = "basic-construction-robot"
basic_robot_item.place_result = "basic-construction-robot"
basic_robot_item.icon = "__base__/graphics/technology/flying.png"
basic_robot_item.icon_size = 128
data:extend({
    basic_robot_item
})

data:extend({
	{
		type = "recipe",
		name = "basic-construction-robot",
		enabled = false,
		ingredients =
		{
			{"engine-unit", 1},
			{"steel-plate", 1},
			{"electronic-circuit", 5}
		},
		result = "basic-construction-robot"
	},
	{
		type = "recipe",
		name = "recycle-basic-construction-robot",
		category = "advanced-crafting",
		subgroup = "recycle-military-equipment",
		icon = "__base__/graphics/technology/flying.png",
		icon_size = 128,
		order = "a",
		ingredients =
		{
			{type="item", name="basic-construction-robot", amount=1}
		},
		results=
		{
			{"engine-unit", 1},
			{"steel-plate", 1},
			{"electronic-circuit", 5}
		},
		energy_required = 1,
		enabled = true
	},
})



--
-- Charger
--

data:extend({
  {
    type = "roboport-equipment",
    name = "robotcharger-equipment",
    take_result = "robotcharger-equipment",
    sprite =
    {
      filename = "__base__/graphics/equipment/personal-roboport-equipment.png",
      width = 64,
      height = 64,
      priority = "medium"
    },
    shape =
    {
      width = 1,
      height = 1,
      type = "full"
    },
    energy_source =
    {
      type = "electric",
      buffer_capacity = "5MJ",
      input_flow_limit = "1MW",
      usage_priority = "secondary-input"
    },
    charging_energy = "500kW",

    robot_limit = 2,
    construction_radius = 10,
    spawn_and_station_height = 0.4,
    charge_approach_distance = 1,

    recharging_animation =
    {
      filename = "__base__/graphics/entity/roboport/roboport-recharging.png",
      priority = "high",
      width = 37,
      height = 35,
      frame_count = 16,
      scale = 1.5,
      animation_speed = 0.5
    },
    recharging_light = {intensity = 0.4, size = 5},
    stationing_offset = {0, -0.6},
    charging_station_shift = {0, 0.5},
    charging_station_count = 1,
    charging_distance = 0.5,
    charging_threshold_distance = 5,
    categories = {"armor"}
  },
})

data:extend({
  {
    type = "recipe",
    name = "robotcharger-equipment",
    enabled = false,
    energy_required = 10,
    ingredients =
    {
      {"electronic-circuit", 10},
      {"iron-gear-wheel", 40},
      {"steel-plate", 20}
    },
    result = "robotcharger-equipment"
  },
  {
    type = "item",
    name = "robotcharger-equipment",
    icon = "__base__/graphics/technology/follower-robots.png",
	icon_size = 128,
    placed_as_equipment_result = "robotcharger-equipment",
    flags = {"goes-to-main-inventory"},
    subgroup = "equipment",
    order = "e[robotics]-a[personal-roboport-equipment]",
    stack_size = 1
  },
	{
		type = "recipe",
		name = "recycle-robotcharger-equipment",
		category = "advanced-crafting",
		subgroup = "recycle-military-equipment",
		icon = "__base__/graphics/technology/follower-robots.png",
		icon_size = 128,
		order = "a",
		ingredients =
		{
			{type="item", name="robotcharger-equipment", amount=1}
		},
		results=
		{
			{"electronic-circuit", 10},
			{"iron-gear-wheel", 40},
			{"steel-plate", 20}
		},
		energy_required = 1,
		enabled = true
	},
})

--
-- Power
--

data:extend({
  {
    type = "generator-equipment",
    name = "generator-equipment",
    sprite =
    {
      filename = "__base__/graphics/technology/electric-engine.png",
      width = 128,
      height = 128,
      priority = "medium"
    },
    shape =
    {
      width = 1,
      height = 1,
      type = "full"
    },
    energy_source =
    {
      type = "electric",
      usage_priority = "primary-output"
    },
    power = "2kW",
    categories = {"armor"}
  },
  {
    type = "recipe",
    name = "generator-equipment",
    enabled = false,
    energy_required = 10,
    ingredients =
    {
      {"electronic-circuit", 25}
    },
    result = "generator-equipment"
  },
  {
    type = "item",
    name = "generator-equipment",
    icon = "__base__/graphics/technology/electric-engine.png",
	icon_size = 128,
    placed_as_equipment_result = "generator-equipment",
    flags = {"goes-to-main-inventory"},
    subgroup = "equipment",
    order = "a[energy-source]-b[generator]",
    stack_size = 20
  },
	{
		type = "recipe",
		name = "recycle-generator-equipment",
		category = "advanced-crafting",
		subgroup = "recycle-military-equipment",
		icon = "__base__/graphics/technology/electric-engine.png",
		icon_size = 128,
		order = "a",
		ingredients =
		{
			{type="item", name="generator-equipment", amount=1}
		},
		results=
		{
			{"electronic-circuit", 25}
		},
		energy_required = 1,
		enabled = true
	},
})



--
-- Armor
--

data:extend({
  {
    type = "equipment-grid",
    name = "tiny-equipment-grid",
    width = 3,
    height = 3,
    equipment_categories = {"armor"}
  },
  {
    type = "armor",
    name = "robot-pack",
    icon = "__base__/graphics/technology/follower-robots.png",
	icon_size = 128,
    flags = {"goes-to-main-inventory"},
    durability = 5000,
    subgroup = "armor",
    order = "b[heavy-armor]",
    stack_size = 1,
    equipment_grid = "tiny-equipment-grid",
    energy_source =
    {
      type = "electric",
      usage_priority = "primary-output"
    },
    power = "10kW",
  },
  {
    type = "recipe",
    name = "robot-pack",
    enabled = false,
    energy_required = 15,
    ingredients =
    {
      {"electronic-circuit", 30},
      {"iron-plate", 40}
    },
    result = "robot-pack"
  },
	{
		type = "recipe",
		name = "recycle-robot-pack",
		category = "advanced-crafting",
		subgroup = "recycle-military",
		icon = "__base__/graphics/technology/follower-robots.png",
		icon_size = 128,
		order = "e",
		ingredients =
		{
			{type="item", name="robot-pack", amount=1}
		},
		results=
		{
			{"electronic-circuit", 30},
			{"iron-plate", 40}
		},
		energy_required = 1,
		enabled = true
	},
})



--
-- Technology
--

data:extend(
{
	{
		type = "technology",
		name = "drone-pack-research",
		icon = "__base__/graphics/technology/flying.png",
		icon_size = 128,
		prerequisites = {"engine"},
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
				recipe = "basic-construction-robot"
			},
		},
		order = "c-a"
	},
})


