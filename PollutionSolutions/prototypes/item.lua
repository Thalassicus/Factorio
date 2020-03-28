data.raw["pipe-to-ground"]["pipe-to-ground"].fluid_box.pipe_connections[2].max_underground_distance=20

local incinerator_item = util.table.deepcopy(data.raw['item']['nuclear-reactor'])
incinerator_item.name = "toxic-incinerator"
incinerator_item.place_result = "toxic-incinerator"
incinerator_item.icon="__PollutionSolutions__/graphics/icons/incinerator.png"
incinerator_item.icon_size=64

local toxicturret_item = util.table.deepcopy(data.raw['item']['flamethrower-turret'])
toxicturret_item.name = "toxic-turret"
toxicturret_item.place_result = "toxic-turret"
incinerator_item.icon_size=64
toxicturret_item.icons={
	{
		icon = "__PollutionSolutions__/graphics/icons/toxic-turret.png"
	},
    {
		icon = data.raw['fluid']['toxic-sludge'].icon,
		scale = 0.25,
		shift = {4, -8}
    }
}
--[[
local airfilter_item = util.table.deepcopy(data.raw['item']['chemical-plant'])
airfilter_item.name = "airfilter"
airfilter_item.place_result = "airfilter"
airfilter_item.stack_size = 50
airfilter_item.icons={
	{
		icon = data.raw['item']['steam-turbine'].icon
	},
    {
		icon = data.raw['fluid']['toxic-sludge'].icon,
		scale = 0.25,
		shift = {4, -8}
    }
}
--]]

local lowheater_item = util.table.deepcopy(data.raw['item']['heat-exchanger'])
lowheater_item.name = "low-heat-exchanger"
lowheater_item.place_result = "low-heat-exchanger"
lowheater_item.icon = "__PollutionSolutions__/graphics/icons/low-heat-boiler.png"
lowheater_item.icon_size=64

local emitter_item = util.table.deepcopy(data.raw['item']['storage-tank'])
emitter_item.name = "dump-site"
emitter_item.place_result = "dump-site"
emitter_item.icon = "__PollutionSolutions__/graphics/icons/toxicdump_icon.png"
emitter_item.icon_size=64
emitter_item.subgroup = "defensive-structure"

data:extend({
	incinerator_item,
	toxicturret_item,
	lowheater_item,
	emitter_item,
	
	{
		type = "item",
		name = "blue-xenomass",
		icon = "__PollutionSolutions__/graphics/icons/blue-xenomass.png",
		icon_size = 64,
		subgroup = "raw-material",
		order = "x[blue-xenomass]",
		stack_size = 200
	},
	{
		type = "item",
		name = "red-xenomass",
		icon = "__PollutionSolutions__/graphics/icons/red-xenomass.png",
		icon_size = 64,
		subgroup = "raw-material",
		order = "x[red-xenomass]",
		stack_size = 50
	},
})