local tier2radar_item =  util.table.deepcopy(data.raw['item']['radar'])
tier2radar_item.name = "radar-outpost"
tier2radar_item.place_result = "radar-outpost"
tier2radar_item.icons={
	{
		icon = data.raw['item']['radar'].icon
	},
    {
      icon = data.raw['item']['solar-panel'].icon,
      scale = 0.5,
      shift = {-8, 8}
    },
    {
      icon = data.raw['item']['accumulator'].icon,
      scale = 0.5,
      shift = {8, 8}
    }
}

local circuitpipe_item = util.table.deepcopy(data.raw['item']['pipe'])
circuitpipe_item.name = "circuit-pipe"
circuitpipe_item.place_result = "circuit-pipe"
circuitpipe_item.stack_size = 10

local bigwall_item =  util.table.deepcopy(data.raw['item']['stone-wall'])
bigwall_item.name = "big-stone-wall"
bigwall_item.place_result = "big-stone-wall"

data:extend({
	tier2radar_item,
	bigwall_item,
	circuitpipe_item,
})