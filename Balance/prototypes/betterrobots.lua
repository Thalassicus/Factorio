data.raw["combat-robot"]["defender"].time_to_live = 10 * 60*60 -- 60 * 45

data.raw["roboport-equipment"]["personal-roboport-equipment"].charge_approach_distance = 1 -- 2.6
data.raw["roboport-equipment"]["personal-roboport-equipment"].charging_distance = 0.5 -- 1.6

data.raw["roboport-equipment"]["personal-roboport-mk2-equipment"].charge_approach_distance = 1 -- 2.6
data.raw["roboport-equipment"]["personal-roboport-mk2-equipment"].charging_distance = 0.5 -- 1.6
data.raw["roboport-equipment"]["personal-roboport-mk2-equipment"].charging_energy = "2000kW" -- 1000
data.raw["roboport-equipment"]["personal-roboport-mk2-equipment"].energy_source = 
    {
      type = "electric",
      buffer_capacity = "70MJ", -- 35
      input_flow_limit = "6000KW", -- 3500
      usage_priority = "secondary-input" -- secondary-input
    }	

table.insert(data.raw["roboport"]["roboport"].charging_offsets,{-2.0, -1.0})

local circle = {
	{-0.5,-0.5},
	{0.5,0.5},
	{-0.5,0.0},
	{0.0,-0.5},
	{0.5,0.0},
	{0.0,0.5}
}
local function mathsign(val)
	if val > 0 then
		return 1
	elseif val < 0 then
		return -1
	else
		return 0
	end
end

local function circlechargingstation(x, y)
	for i = 1, 6 do
		table.insert(data.raw["roboport"]["roboport"].charging_offsets,{(math.abs(x)+circle[i][1])*mathsign(x), (math.abs(y)+circle[i][2])*mathsign(y)})
	end
end

circlechargingstation(-1.5,-0.5)
circlechargingstation(1.5, -0.5)
circlechargingstation(1.5, 1.5)
circlechargingstation(-1.5, 1.5)