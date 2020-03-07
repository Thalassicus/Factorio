require "util"

------------
-- Entity --
------------

local pollutioncollector = util.table.deepcopy(data.raw["storage-tank"]["storage-tank"])
pollutioncollector.name = "pollutioncollector"
pollutioncollector.order = "z"
pollutioncollector.minable.result = "pollutioncollector"
pollutioncollector.crafting_categories = {"pollution"}
local copyStats = {
	"icon",
	"icon_size",
}
for _, v in pairs (copyStats) do
	pollutioncollector[v] = copyData("generator", "steam-turbine", v) --util.table.deepcopy(data.raw["generator"]["steam-turbine"][v])
end
pollutioncollector.pictures.picture.sheets[1].filename = "__PollutionSolutions__/graphics/entity/pollution-collector/pollution-collector.png"
pollutioncollector.pictures.picture.sheets[1].hr_version.filename = "__PollutionSolutions__/graphics/entity/pollution-collector/hr-pollution-collector.png"
pollutioncollector.fluid_box.filter = "polluted-air"
for i=1, #pollutioncollector.fluid_box.pipe_connections, 1 do
	pollutioncollector.fluid_box.pipe_connections[i].type = "input-output"
end
pollutioncollector.fluid_box.base_area = 100

----------
-- Item --
----------

local pollutioncollector_item = util.table.deepcopy(data.raw['item']['steam-turbine'])
pollutioncollector_item.name = "pollutioncollector"
pollutioncollector_item.place_result = "pollutioncollector"
pollutioncollector_item.stack_size = 50
pollutioncollector_item.icons={
	{
		icon = copyData("item", "steam-turbine", "icon")
	},
    {
		icon = copyData("fluid", "toxicsludge", "icon"),
		scale = 0.5,
		shift = {4, -8}
    }
}



------------
-- Extend --
------------

data:extend({
	pollutioncollector,
	pollutioncollector_item,
	{
		type = "recipe",
		name = "pollutioncollector",
		energy_required = 5,
		enabled = false,
		ingredients =
		{
			{name="xenovasi",			amount=5},
			{name="electronic-circuit",	amount=5},
			{name="iron-gear-wheel",	amount=50},
			{name="pipe", 				amount=50},
		},
		result= "pollutioncollector"
	},
})
