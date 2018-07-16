data.raw["pipe-to-ground"]["pipe-to-ground"].fluid_box.pipe_connections[2].max_underground_distance=20

local incinerator_item = util.table.deepcopy(data.raw['item']['nuclear-reactor'])
incinerator_item.name = "incinerator"
incinerator_item.place_result = "incinerator"
incinerator_item.icon="__PollutionControls__/graphics/icons/incinerator.png"

local toxicturret_item = util.table.deepcopy(data.raw['item']['flamethrower-turret'])
toxicturret_item.name = "toxic-turret"
toxicturret_item.place_result = "toxic-turret"
toxicturret_item.icons={
	{
		icon = data.raw['item']['flamethrower-turret'].icon
	},
    {
		icon = data.raw['fluid']['toxicsludge'].icon,
		scale = 0.5,
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
		icon = data.raw['fluid']['toxicsludge'].icon,
		scale = 0.5,
		shift = {4, -8}
    }
}
--]]

local lowheater_item = util.table.deepcopy(data.raw['item']['heat-exchanger'])
lowheater_item.name = "low-heat-exchanger"
lowheater_item.place_result = "low-heat-exchanger"
lowheater_item.icon = "__PollutionControls__/graphics/icons/low-heat-boiler.png"

local emitter_item = util.table.deepcopy(data.raw['item']['storage-tank'])
emitter_item.name = "dump-site"
emitter_item.place_result = "dump-site"
emitter_item.icon = "__PollutionControls__/graphics/icons/toxicdump_icon.png"
emitter_item.subgroup = "defensive-structure"

data:extend({
	incinerator_item,
	toxicturret_item,
	lowheater_item,
	emitter_item,
	
	{
		type = "item",
		name = "xenomeros",
		icon = "__PollutionControls__/graphics/icons/xenomeros.png",
		icon_size = 128,
		flags = {"goes-to-main-inventory"},
		subgroup = "raw-material",
		order = "x[xenomeros]",
		stack_size = 200
	},
	{
		type = "item",
		name = "xenovasi",
		icon = "__PollutionControls__/graphics/icons/xenovasi.png",
		icon_size = 128,
		flags = {"goes-to-main-inventory"},
		subgroup = "raw-material",
		order = "x[xenovasi]",
		stack_size = 50
	},
})