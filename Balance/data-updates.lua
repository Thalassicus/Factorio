
if data.raw["car"]["indep-boat"] ~= nil then
	data.raw["car"]["indep-boat"].working_sound = table.deepcopy(data.raw["car"]["car"]).working_sound
	data.raw["locomotive"]["boat_engine"].working_sound = table.deepcopy(data.raw["car"]["car"]).working_sound
	data.raw["locomotive"]["cargo_ship_engine"].working_sound = table.deepcopy(data.raw["car"]["tank"]).working_sound
end

data.raw["combat-robot"]["distractor"].working_sound = 
{
	sound =
	{
		filename = "__base__/sound/fight/distractor-robot-loop.ogg",
		volume = 0
	},
	apparent_volume = 0,
	persistent = false
}