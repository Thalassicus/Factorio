-- The technology the barrel unlocks will be added to
local technology_name = "fluid-handling"
-- The base empty barrel item
local empty_barrel_name = "empty-barrel"

-- Item icon masks
local barrel_side_mask = "__base__/graphics/icons/fluid/barreling/barrel-side-mask.png"
local barrel_hoop_top_mask = "__base__/graphics/icons/fluid/barreling/barrel-hoop-top-mask.png"

-- Recipe icon masks
local barrel_empty = "__base__/graphics/icons/fluid/barreling/barrel-empty.png"
local barrel_empty_side_mask = "__base__/graphics/icons/fluid/barreling/barrel-empty-side-mask.png"
local barrel_empty_top_mask = "__base__/graphics/icons/fluid/barreling/barrel-empty-top-mask.png"
local barrel_fill = "__base__/graphics/icons/fluid/barreling/barrel-fill.png"
local barrel_fill_side_mask = "__base__/graphics/icons/fluid/barreling/barrel-fill-side-mask.png"
local barrel_fill_top_mask = "__base__/graphics/icons/fluid/barreling/barrel-fill-top-mask.png"

-- Alpha used for barrel masks
local side_alpha = 0.75
local top_hoop_alpha = 0.75
-- Fluid required per barrel recipe
local fluid_per_barrel = 50
-- Crafting energy per barrel fill recipe
local energy_per_fill = 1
-- Crafting energy per barrel empty recipe
local energy_per_empty = 1
-- If the fill/empty recipes effect production statistics
local hide_barreling_from_production_stats = true
-- If the fill/empty recipes should be included in the list of valid recipes things can use when calculating raw materials
local allow_barreling_decomposition = false


local function get_technology(name)
  local technologies = data.raw["technology"]
  if technologies then
    return technologies[name]
  end
  return nil
end

local function get_item(name)
  local items = data.raw["item"]
  if items then
    return items[name]
  end
  return nil
end

-- Generates the icons definition for a barrel item with the provided name and fluid definition using the provided empty barrel base icon
local function generate_barrel_item_icons(name, fluid, empty_barrel_item)
  local side_tint = util.table.deepcopy(fluid.base_color)
  side_tint.a = side_alpha
  local top_hoop_tint = util.table.deepcopy(fluid.flow_color)
  top_hoop_tint.a = top_hoop_alpha

  return
  {
    {
      icon = empty_barrel_item.icon
    },
    {
      icon = barrel_side_mask,
      tint = side_tint
    },
    {
      icon = barrel_hoop_top_mask,
      tint = top_hoop_tint
    }
  }
end

-- Generates a barrel item with the provided name and fluid definition using the provided empty barrel stack size
local function create_barrel_item(name, fluid, empty_barrel_item)
  local result =
  {
    type = "item",
    name = name,
    localised_name = {"item-name.filled-barrel", {"fluid-name." .. fluid.name}},
    icons = generate_barrel_item_icons(name, fluid, empty_barrel_item),
    icon_size = 32,
    flags = {"goes-to-main-inventory"},
    subgroup = "fill-barrel",
    order = "b[" .. name .. "]",
    stack_size = empty_barrel_item.stack_size,
	fuel_category = "waste",
	burnt_result = "empty-barrel",
	fuel_value = "50MJ"
  }

  data:extend({result})
  return result
end

local function get_or_create_barrel_item(name, fluid, empty_barrel_item)
  return create_barrel_item(name, fluid, empty_barrel_item)
end

-- Generates the icons definition for a fill-barrel recipe with the provided barrel name and fluid definition
local function generate_fill_barrel_icons(name, fluid)
  local side_tint = util.table.deepcopy(fluid.base_color)
  side_tint.a = side_alpha
  local top_hoop_tint = util.table.deepcopy(fluid.flow_color)
  top_hoop_tint.a = top_hoop_alpha

  return
  {
    {
      icon = "__base__/graphics/icons/fluid/barreling/barrel-fill.png"
    },
    {
      icon = barrel_fill_side_mask,
      tint = side_tint
    },
    {
      icon = barrel_fill_top_mask,
      tint = top_hoop_tint
    },
    {
      icon = fluid.icon,
      scale = 0.5,
      shift = {4, -8}
    }
  }
end

-- Generates the icons definition for a empty-barrel recipe with the provided barrel name and fluid definition
local function generate_empty_barrel_icons(name, fluid)
  local side_tint = util.table.deepcopy(fluid.base_color)
  side_tint.a = side_alpha
  local top_hoop_tint = util.table.deepcopy(fluid.flow_color)
  top_hoop_tint.a = top_hoop_alpha

  return
  {
    {
      icon = "__base__/graphics/icons/fluid/barreling/barrel-empty.png"
    },
    {
      icon = barrel_empty_side_mask,
      tint = side_tint
    },
    {
      icon = barrel_empty_top_mask,
      tint = top_hoop_tint
    },
    {
      icon = fluid.icon,
      scale = 0.5,
      shift = {7, 8}
    }
  }
end

-- Creates a recipe to fill the provided barrel item with the provided fluid
local function create_fill_barrel_recipe(item, fluid)
  local recipe =
  {
    type = "recipe",
    name = "fill-" .. item.name,
    localised_name = {"recipe-name.fill-barrel", {"fluid-name." .. fluid.name}},
    category = "crafting-with-fluid",
    energy_required = energy_per_fill,
    subgroup = "fill-barrel",
    order = "b[fill-" .. item.name .. "]",
    enabled = false,
    icons = generate_fill_barrel_icons(item, fluid),
    icon_size = 32,
    ingredients =
    {
      {type = "fluid", name = fluid.name, amount = fluid_per_barrel},
      {type = "item", name = empty_barrel_name, amount = 1},
    },
    results=
    {
      {type = "item", name = item.name, amount = 1}
    },
    hide_from_stats = hide_barreling_from_production_stats,
    allow_decomposition = allow_barreling_decomposition
  }

  data:extend({recipe})
  return recipe
end

-- Creates a recipe to empty the provided full barrel item producing the provided fluid
local function create_empty_barrel_recipe(item, fluid)
  local recipe =
  {
    type = "recipe",
    name = "empty-" .. item.name,
    localised_name = {"recipe-name.empty-filled-barrel", {"fluid-name." .. fluid.name}},
    category = "crafting-with-fluid",
    energy_required = energy_per_empty,
    subgroup = "empty-barrel",
    order = "c[empty-" .. item.name .. "]",
    enabled = false,
    icons = generate_empty_barrel_icons(item, fluid),
    icon_size = 32,
    ingredients =
    {
      {type = "item", name = item.name, amount = 1}
    },
    results=
    {
      {type = "fluid", name = fluid.name, amount = fluid_per_barrel},
      {type = "item", name = empty_barrel_name, amount = 1}
    },
    hide_from_stats = hide_barreling_from_production_stats,
    allow_decomposition = allow_barreling_decomposition
  }

  data:extend({recipe})
  return recipe
end

local function get_or_create_barrel_recipes(item, fluid)
  local fill_recipe, empty_recipe

  --if not fill_recipe then
    fill_recipe = create_fill_barrel_recipe(item, fluid)
  --end
  --if not empty_recipe then
    empty_recipe = create_empty_barrel_recipe(item, fluid)
  --end

  return fill_recipe, empty_recipe
end

--[[ Adds the provided barrel recipe and fill/empty recipes to the technology as recipe unlocks if they don't already exist
local function add_barrel_to_technology(item, fill_recipe, empty_recipe, technology)
  local unlock_key = "unlock-recipe"
  local effects = technology.effects

  if not effects then
    technology.effects = {}
    effects = technology.effects
  end

  local add_item = true
  local add_fill_recipe = true
  local add_empty_recipe = true

  for k,v in pairs(effects) do
    if k == unlock_key then
      local recipe = v.recipe
      if recipe == item.name then
        add_item = false
      elseif recipe == fill_recipe.name then
        add_fill_recipe = false
      elseif recipe == empty_recipe.name then
        add_empty_recipe = false
      end
    end
  end

  if add_fill_recipe then
    table.insert(effects, {type = unlock_key, recipe = fill_recipe.name})
  end
  if add_empty_recipe then
    table.insert(effects, {type = unlock_key, recipe = empty_recipe.name})
  end
end
--]]

local function process_fluid(fluid, technology, empty_barrel_item)
  local barrel_name = fluid.name .. "-barrel"

  -- check if a barrel already exists for this fluid if not - create one
  local barrel_item = get_or_create_barrel_item(barrel_name, fluid, empty_barrel_item)

  -- check if the barrel has a recipe if not - create one
  local barrel_fill_recipe, barrel_empty_recipe = get_or_create_barrel_recipes(barrel_item, fluid)

  -- check if the barrel recipe exists in the unlock list of the technology if not - add it
  --add_barrel_to_technology(barrel_item, barrel_fill_recipe, barrel_empty_recipe, technology)
end

process_fluid(data.raw["fluid"]["toxicsludge"], get_technology(technology_name), get_item(empty_barrel_name))

local function addResistance(entityList, damagetype, percent)
	if not entityList then
		log("Failed to make entity list immune.")
	end
	for name,entity in pairs(entityList) do
		if not entity.resistances then
			entityList[name].resistances = {{
				type = damagetype,
				percent = percent,
			}}
		else
			table.insert(entityList[name].resistances,
			{
				type = damagetype,
				percent = percent,
			})
		end
	end
end

addResistance(data.raw["wall"],					"poison", 100)
addResistance(data.raw["gate"],					"poison", 100)
addResistance(data.raw["transport-belt"],		"poison", 100)
addResistance(data.raw["car"],					"poison", 100)
addResistance(data.raw["electric-turret"],		"poison", 100)
addResistance(data.raw["ammo-turret"],			"poison", 100)
addResistance(data.raw["construction-robot"],	"poison", 100)
addResistance(data.raw["combat-robot"],			"poison", 100)
addResistance(data.raw["logistic-robot"],		"poison", 100)
addResistance(data.raw["logistic-container"],	"poison", 100)
addResistance(data.raw["container"],			"poison", 100)
addResistance(data.raw["electric-pole"],		"poison", 100)
addResistance(data.raw["heat-pipe"],			"poison", 100)
addResistance(data.raw["pipe"],					"poison", 100)
addResistance(data.raw["pipe-to-ground"],		"poison", 100)
addResistance(data.raw["land-mine"],			"poison", 100)
addResistance(data.raw["straight-rail"],		"poison", 100)
addResistance(data.raw["curved-rail"],			"poison", 100)
addResistance(data.raw["train-stop"],			"poison", 100)
addResistance(data.raw["locomotive"],			"poison", 100)
addResistance(data.raw["rail-signal"],			"poison", 100)
addResistance(data.raw["rail-chain-signal"],	"poison", 100)
addResistance(data.raw["underground-belt"],		"poison", 100)
addResistance(data.raw["lamp"],					"poison", 100)
addResistance(data.raw["cargo-wagon"],			"poison", 100)
addResistance(data.raw["fluid-wagon"],			"poison", 100)
addResistance(data.raw["artillery-wagon"],		"poison", 100)
addResistance(data.raw["tree"],					"poison", 100)
addResistance(data.raw["radar"],				"poison", 100)

addResistance(data.raw["pipe"],					"fire", 100)
addResistance(data.raw["pipe-to-ground"],		"fire", 100)
addResistance(data.raw["pipe"],					"explosion", 100)
addResistance(data.raw["pipe-to-ground"],		"explosion", 100)

addResistance(data.raw["construction-robot"],	"fire", 100)
addResistance(data.raw["combat-robot"],			"fire", 100)
addResistance(data.raw["logistic-robot"],		"fire", 100)
addResistance(data.raw["logistic-container"],	"fire", 100)
addResistance(data.raw["construction-robot"],	"explosion", 100)
addResistance(data.raw["combat-robot"],			"explosion", 100)
addResistance(data.raw["logistic-robot"],		"explosion", 100)
addResistance(data.raw["logistic-container"],	"explosion", 100)



--data.raw["pipe"].collision_mask = {"item-layer", "object-layer", "water-tile"}
data.raw["pipe-to-ground"]["pipe-to-ground"].collision_mask = {"item-layer", "object-layer", "water-tile"}