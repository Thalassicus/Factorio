
if data.raw["car"]["indep-boat"] ~= nil then
	data.raw["car"]["indep-boat"].working_sound = table.deepcopy(data.raw["car"]["car"]).working_sound
	data.raw["locomotive"]["boat_engine"].working_sound = table.deepcopy(data.raw["car"]["car"]).working_sound
	data.raw["locomotive"]["cargo_ship_engine"].working_sound = table.deepcopy(data.raw["car"]["tank"]).working_sound
end