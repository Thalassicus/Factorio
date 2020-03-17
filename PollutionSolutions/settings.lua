data:extend{
  {
    type = "int-setting",
    name = "zpollution-air-per-sludge",
    setting_type = "startup",
    minimum_value = 1,
    default_value = 10,
		order = "a-a"
  },
  {
    type = "int-setting",
    name = "zpollution-sludge-per-filter",
    setting_type = "startup",
    minimum_value = 1,
    default_value = 100,
		order = "a-b"
  },
  {
    type = "int-setting",
    name = "zpollution-sludge-per-barrel",
    setting_type = "startup",
    minimum_value = 1,
    default_value = 50,
		order = "a-c"
  },
  {
    type = "double-setting",
    name = "zpollution-mj-per-sludge",
    setting_type = "startup",
    minimum_value = 0.001,
    default_value = 10,
		order = "a-d"
  },
  {
    type = "double-setting",
    name = "zpollution-incenerator-efficiency",
    setting_type = "startup",
    minimum_value = 0.01,
    default_value = 0.1,
    maximum_value = 1.0,
		order = "a-e"
  },
  {
    type = "double-setting",
    name = "zpollution-incenerator-output",
    setting_type = "startup",
    minimum_value = 0.001,
    default_value = 2.0,
		order = "a-f"
  },
  {
    type = "int-setting",
    name = "zpollution-blue-per-red",
    setting_type = "startup",
    minimum_value = 1,
    default_value = 10,
		order = "b-a"
  },
  {
    type = "double-setting",
    name = "zpollution-blue-to-red-cost",
    setting_type = "startup",
    minimum_value = 1,
    default_value = 2.0,
		order = "b-b"
  },
  {
    type = "bool-setting",
    name = "zpollution-pipe-collision",
    setting_type = "startup",
    default_value = false,
		order = "c-a"
  },
  {
    type = "int-setting",
    name = "zpollution-pipe-distance",
    setting_type = "startup",
    minimum_value = 5,
    default_value = 20,
		order = "c-b"
  },
  {
    type = "double-setting",
    name = "zpollution-tree-absorption",
    setting_type = "startup",
    minimum_value = 0,
    default_value = 0.01,
		order = "c-b"
  },
  
  {
    type = "int-setting",
    name = "zpollution-collection-interval",
    setting_type = "runtime-global",
    minimum_value = 1,
    default_value = 60,
		order = "a-a"
  },
  {
    type = "double-setting",
    name = "zpollution-collection-max-percent",
    setting_type = "runtime-global",
    minimum_value = 0.01,
    default_value = 0.10,
    maximum_value = 1.00,
		order = "a-b"
  },
  {
    type = "double-setting",
    name = "zpollution-blue-per-alien",
    setting_type = "runtime-global",
    minimum_value = 0.01,
    default_value = 1,
		order = "b-a"
  },
  {
    type = "double-setting",
    name = "zpollution-red-per-alien",
    setting_type = "runtime-global",
    minimum_value = 0.01,
    default_value = 5,
		order = "b-b"
  },
  {
    type = "int-setting",
    name = "zpollution-pickup-interval",
    setting_type = "runtime-global",
    minimum_value = 0,
    default_value = 60,
		order = "b-c"
  },
  {
    type = "int-setting",
    name = "zpollution-pickup-safety-distance",
    setting_type = "runtime-global",
    minimum_value = 0,
    default_value = 32,
		order = "b-d"
  },
}