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
      buffer_capacity = "20MJ",
      input_flow_limit = "2000KW",
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
    energy_required = 5,
    ingredients =
    {
      {"iron-plate", 5},
      {"electronic-circuit", 2},
      {"iron-gear-wheel", 10},
    },
    result = "robotcharger-equipment"
  },
  {
    type = "item",
    name = "robotcharger-equipment",
    icon = "__base__/graphics/technology/follower-robots.png",
	icon_size = 128,
    placed_as_equipment_result = "robotcharger-equipment",
    subgroup = "equipment",
    order = "e[robotics]-a[personal-roboport-equipment]",
    stack_size = 20
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
    power = "3kW",
    categories = {"armor"}
  },
  {
    type = "recipe",
    name = "generator-equipment",
    enabled = false,
    energy_required = 10,
    ingredients =
    {
      {"engine-unit", 1},
      {"electronic-circuit", 2},
    },
    result = "generator-equipment"
  },
  {
    type = "item",
    name = "generator-equipment",
    icon = "__base__/graphics/technology/electric-engine.png",
	icon_size = 128,
    placed_as_equipment_result = "generator-equipment",
    subgroup = "equipment",
    order = "a[energy-source]-b[generator]",
    stack_size = 20
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
})
