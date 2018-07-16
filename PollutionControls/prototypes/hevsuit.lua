require "util"
require "constants"

------------
-- Entity --
------------



----------
-- Item --
----------
local hev_item = makeNewDataFromData("armor","light-armor","hev-armor")
hev_item.order = "a[hev-armor]"
hev_item.resistances = {
	{
        type = "fire",
        decrease = 20,
        percent = 90
	},
	{
        type = POLLUTION_DAMAGE_TYPE,
        decrease = 20,
        percent = 90
	},
	{
        type = "poison",
        decrease = 20,
        percent = 90
	},
	{
        type = "acid",
        decrease = 20,
        percent = 90
	},
	{
        type = "electric",
        decrease = 20,
        percent = 90
	},
}


------------
-- Extend --
------------
data:extend({
	hev_item,
	{
		type = "recipe",
		name = "hev-armor",
		enabled = true,
		energy_required = 3,
		ingredients = {
			{type="item", name="iron-plate", amount=10},
			{type="item", name="xenovasi", amount=20},
		},
		result = "hev-armor"
	},
})