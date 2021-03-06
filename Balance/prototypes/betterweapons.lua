--require "table"

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

--[[
data.raw["projectile"]["rocket"].action.action_delivery.target_effects[2].damage.amount = 100
data.raw["projectile"]["explosive-rocket"].action.action_delivery.target_effects[4].action.action_delivery.target_effects[1].damage.amount = 60
data.raw["projectile"]["grenade"].action[2].action_delivery.target_effects[1].damage.amount = 40
--]]
data.raw["gun"]["rocket-launcher"].attack_parameters.range = 60
data.raw["gun"]["tank-cannon"].attack_parameters.range = 60 -- 25
data.raw["ammo"]["cannon-shell"].ammo_type.action.action_delivery.max_range = 60 					-- 30
data.raw["ammo"]["explosive-cannon-shell"].ammo_type.action.action_delivery.max_range = 60 			-- 30
data.raw["ammo"]["uranium-cannon-shell"].ammo_type.action.action_delivery.max_range = 80 			-- 30
data.raw["ammo"]["explosive-uranium-cannon-shell"].ammo_type.action.action_delivery.max_range = 80 	-- 30
data.raw["car"]["tank"].weight = 40000					-- 20000
data.raw["car"]["tank"].turret_rotation_speed = 1 / 60	-- 0.35
data.raw["car"]["tank"].effectivity = 0.6				-- 0.6
data.raw["car"]["tank"].burner.effectivity = 0.7		-- 0.75
data.raw["car"]["tank"].consumption = "1200kW"			-- 600kW
data.raw["car"]["tank"].braking_power = "800kW"			-- 400kW
data.raw["car"]["tank"].terrain_friction_modifier = 0.05-- 0.2
data.raw["car"]["tank"].friction = 0.002				-- 0.02
--data.raw["car"]["tank"].guns = { "tank-cannon", "tank-machine-gun", "flamethrower" }
data.raw["car"]["tank"].resistances =
    {
      {
        type = "fire",
        decrease = 15,
        percent = 60
      },
      {
        type = "physical",
        decrease = 15,
        percent = 60
      },
      {
        type = "impact",
        decrease = 50,
        percent = 99 -- 80
      },
      {
        type = "explosion",
        decrease = 15,
        percent = 90 -- 70
      },
      {
        type = "acid",
        decrease = 15,
        percent = 50
      },
      {
        type = "poison",
        decrease = 0,
        percent = 100
      }
    }
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

for damageType, _ in pairs(data.raw["damage-type"]) do
	data.raw["land-mine"]["land-mine"].resistances[damageType] = {
		type = damageType,
		percent = 100
	}
end
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