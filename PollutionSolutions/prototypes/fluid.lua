local toxicsludge = util.table.deepcopy(data.raw['fluid']['crude-oil'])
toxicsludge.name = "toxic-sludge"
toxicsludge.base_color = {r=0.333, g=0.063, b=0.451}
toxicsludge.flow_color = {r=0.744, g=0.275, b=0.867}
toxicsludge.icon = "__PollutionSolutions__/graphics/icons/fluid/toxicsludge.png"
toxicsludge.icon_size = 64
toxicsludge.order = "a[fluid]-b[toxicsludge]"

local pollution = util.table.deepcopy(data.raw['fluid']['crude-oil'])
pollution.name = "polluted-air"
pollution.auto_barrel = false
pollution.base_color = {r=0.500, g=0.000, b=0.000}
pollution.flow_color = {r=1.00, g=0.000, b=0.000}
pollution.icon = "__PollutionSolutions__/graphics/icons/fluid/pollution.png"
pollution.icon_size = 64
pollution.order = "a[fluid]-b[pollution]"

data:extend({
	toxicsludge,
	pollution,
})