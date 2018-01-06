require "table"

data.raw["recipe"]["artillery-wagon"].ingredients = {
      {"engine-unit", 64},
      {"iron-gear-wheel", 10},
      {"steel-plate", 40},
      {"pipe", 16},
      {"advanced-circuit", 20},
      {"radar", 10}
}
data.raw["recipe"]["artillery-turret"].ingredients = {
      {"steel-plate", 60},
      {"concrete", 60},
      {"iron-gear-wheel", 40},
      {"advanced-circuit", 20},
      {"radar", 10},
}
data.raw["recipe"]["artillery-shell"].ingredients = {
      {"explosive-cannon-shell", 4},
      {"explosives", 8},
}

--[""][""]
--data.raw["projectile"]["rocket"].action.action_delivery.target_effects[2].damage.amount = 100
--data.raw["projectile"]["explosive-rocket"].action.action_delivery.target_effects[2].action.action_delivery.target_effects[1].damage.amount = 60
--data.raw["projectile"]["grenade"].action[2].action_delivery.target_effects[1].damage.amount = 40
data.raw["gun"]["rocket-launcher"].attack_parameters.range = 80
data.raw["wall"]["stone-wall"].resistances[3].percent = 80 --explosion resistance
data.raw["land-mine"]["land-mine"].resistances =
{
	{
        type = "explosion",
        percent = 100
	},
	{
        type = "fire",
        percent = 100
	}
}
--[[
table.insert(data.raw["technology"]["laser-turret-damage-1"].effects,
	{
		type = "ammo-damage",
		ammo_category = "electric",
		modifier = "0.4"
	})
table.insert(data.raw["technology"]["laser-turret-damage-2"].effects,
	{
		type = "ammo-damage",
		ammo_category = "electric",
		modifier = "0.4"
	})
table.insert(data.raw["technology"]["laser-turret-damage-3"].effects,
	{
		type = "ammo-damage",
		ammo_category = "electric",
		modifier = "0.4"
	})
table.insert(data.raw["technology"]["laser-turret-damage-4"].effects,
	{
		type = "ammo-damage",
		ammo_category = "electric",
		modifier = "0.4"
	})

table.insert(data.raw["technology"]["laser-turret-damage-5"].effects,
	{
		type = "ammo-damage",
		ammo_category = "electric",
		modifier = "0.4"
	})

table.insert(data.raw["technology"]["laser-turret-damage-6"].effects,
	{
		type = "ammo-damage",
		ammo_category = "electric",
		modifier = "0.4"
	})

table.insert(data.raw["technology"]["laser-turret-speed-1"].effects,
	{
		type = "gun-speed",
		ammo_category = "electric",
		modifier = "0.2"
	})

table.insert(data.raw["technology"]["laser-turret-speed-2"].effects,
	{
		type = "gun-speed",
		ammo_category = "electric",
		modifier = "0.2"
	})

table.insert(data.raw["technology"]["laser-turret-speed-3"].effects,
	{
		type = "gun-speed",
		ammo_category = "electric",
		modifier = "0.3"
	})

table.insert(data.raw["technology"]["laser-turret-speed-4"].effects,
	{
		type = "gun-speed",
		ammo_category = "electric",
		modifier = "0.3"
	})

table.insert(data.raw["technology"]["laser-turret-speed-5"].effects,
	{
		type = "gun-speed",
		ammo_category = "electric",
		modifier = "0.3"
	})

table.insert(data.raw["technology"]["laser-turret-speed-6"].effects,
	{
		type = "gun-speed",
		ammo_category = "electric",
		modifier = "0.3"
	})
--]]