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
hev_item.durability = 500
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
		enabled = false,
		energy_required = 3,
		ingredients = {
			{type="item", name="iron-plate", amount=10},
			{type="item", name="xenomeros", amount=100},
		},
		result = "hev-armor"
	},
})