data.raw["solar-panel"]["solar-panel"].production = "180kW"

data.raw["accumulator"]["accumulator"].energy_source.buffer_capacity = "17MJ"
data.raw["accumulator"]["accumulator"].energy_source.input_flow_limit = "500kW"
data.raw["accumulator"]["accumulator"].energy_source.output_flow_limit = "1MW"

data.raw["recipe"]["accumulator"].ingredients = {
	{"steel-plate", 6},
	{"battery", 15}
}

data.raw["recipe"]["solar-panel"].ingredients = {
	{"steel-plate", 15},
	{"electronic-circuit", 45},
	{"copper-plate", 15}
}

data.raw["recipe"]["solar-panel-equipment"].ingredients = {
    {"solar-panel", 2},
    {"advanced-circuit", 1},
    {"steel-plate", 5}
}