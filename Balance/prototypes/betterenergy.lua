--[[

-- increase cost and output
data.raw["solar-panel"]["solar-panel"].production = "120kW" -- was 60
data.raw["recipe"]["solar-panel"].ingredients = {
	{"steel-plate", 10},
	{"electronic-circuit", 30},
	{"copper-plate", 10}
}
data.raw["recipe"]["solar-panel-equipment"].result_count = 2

-- increase cost and output
data.raw["accumulator"]["accumulator"].energy_source.buffer_capacity = "10MJ" -- was 5
data.raw["accumulator"]["accumulator"].energy_source.input_flow_limit = "600kW"
data.raw["accumulator"]["accumulator"].energy_source.output_flow_limit = "600kW"
data.raw["recipe"]["accumulator"].ingredients = {
	{"steel-plate", 4},
	{"battery", 10}
}
data.raw["recipe"]["satellite"].ingredients = {
	{"low-density-structure", 100},
	{"solar-panel", 50},
	{"accumulator", 50},
	{"radar", 5},
	{"processing-unit", 100},
	{"rocket-fuel", 50}
}
--]]