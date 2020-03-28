
if data.raw["car"]["indep-boat"] ~= nil then
	local  speed_modifier = settings.startup["speed_modifier"].value;
	data.raw["car"]["indep-boat"].working_sound = table.deepcopy(data.raw["car"]["car"]).working_sound
	data.raw["car"]["indep-boat"].braking_power = "100kW"
	data.raw["car"]["indep-boat"].weight = 500
	data.raw["car"]["indep-boat"].friction = 0.05/speed_modifier
	data.raw["car"]["indep-boat"].rotation_speed = 0.005
	data.raw["car"]["indep-boat"].consumption = (200 + (speed_modifier -1) * 100).."kW"
	data.raw["locomotive"]["boat_engine"].working_sound = table.deepcopy(data.raw["car"]["car"]).working_sound
	data.raw["locomotive"]["cargo_ship_engine"].working_sound = table.deepcopy(data.raw["car"]["tank"]).working_sound
	data.raw["locomotive"]["cargo_ship_engine"].max_power = (200 + (speed_modifier -1) * 100).."kW"

	local max_speed = 1 * speed_modifier
	local air_resistance = 0.02/speed_modifier
	local weight = 250 -- buoyancy reduces effective weight
	data.raw["cargo-wagon"]["boat"].weight = weight
	data.raw["cargo-wagon"]["boat"].max_speed = max_speed
	data.raw["cargo-wagon"]["boat"].air_resistance = air_resistance
	data.raw["locomotive"]["boat_engine"].weight = weight
	data.raw["locomotive"]["boat_engine"].max_speed = max_speed
	data.raw["locomotive"]["boat_engine"].air_resistance = air_resistance

	max_speed = 0.2 * speed_modifier
	air_resistance = 0.05/speed_modifier
	weight = 1000
	data.raw["locomotive"]["cargo_ship_engine"].weight = weight
	data.raw["locomotive"]["cargo_ship_engine"].max_speed = max_speed
	data.raw["locomotive"]["cargo_ship_engine"].air_resistance = air_resistance
	data.raw["cargo-wagon"]["cargo_ship"].weight = weight
	data.raw["cargo-wagon"]["cargo_ship"].max_speed = max_speed
	data.raw["cargo-wagon"]["cargo_ship"].air_resistance = air_resistance
	data.raw["fluid-wagon"]["oil_tanker"].weight = weight
	data.raw["fluid-wagon"]["oil_tanker"].max_speed = max_speed
	data.raw["fluid-wagon"]["oil_tanker"].air_resistance = air_resistance
	data.raw["train-stop"]["port"].collision_mask = {}
	data.raw["rail-signal"]["buoy"].collision_mask = {}
	data.raw["rail-chain-signal"]["chain_buoy"].collision_mask = {}
	data.raw["electric-pole"]["floating-electric-pole"].collision_mask = {'ground-tile'}
end

data.raw["combat-robot"]["distractor"].working_sound = nil
data.raw["combat-robot"]["defender"].working_sound = nil
data.raw["combat-robot"]["destroyer"].working_sound = nil