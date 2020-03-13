
-------------
--- TECHS ---
-------------

data.raw["technology"]["warehouse-research"].prerequisites = { }
data.raw["technology"]["warehouse-research"].unit =
		{
			count = 30,
			ingredients = {{ "automation-science-pack", 1}},
			time = 15
		}
data.raw["technology"]["warehouse-research"].effects = { 
	--[[
	{
		type = "unlock-recipe",
		recipe = "rail-loading-yard",
	},]]
	{
		type = "unlock-recipe",
		recipe = "storehouse-basic",
	},
	{
		type = "unlock-recipe",
		recipe = "warehouse-basic",
	},
}

data:extend({
	{
		type = "technology",
		name = "warehouse-robotics",
		icon = "__Warehousing__/graphics/research/warehouse-logistics-research.png",
		icon_size = 128,
		effects = {
			{
				type = "unlock-recipe",
				recipe = "storehouse-passive-provider",
			},
			{
				type = "unlock-recipe",
				recipe = "storehouse-storage",
			},
			{
				type = "unlock-recipe",
				recipe = "warehouse-passive-provider",
			},
			{
				type = "unlock-recipe",
				recipe = "warehouse-storage",
			},
		},
		prerequisites = {"warehouse-research", "robotics"},
		unit = {
			count = 100,
			ingredients = {
				{"automation-science-pack", 1},
				{"logistic-science-pack", 1}
			},
			time = 30
		},
		order = "c-k-a",
	},
})

--[[
data.raw["technology"]["warehouse-logistics-research"].prerequisites = { "warehouse-robotics", "logistic-system" }
data.raw["technology"]["warehouse-logistics-research"].effects = { 
	{
		type = "unlock-recipe",
		recipe = "storehouse-active-provider",
	},
	{
		type = "unlock-recipe",
		recipe = "storehouse-requester",
	},
	{
		type = "unlock-recipe",
		recipe = "warehouse-active-provider",
	},
	{
		type = "unlock-recipe",
		recipe = "warehouse-requester",
	},
}
--]]



---------------
--- PACKING ---
---------------

local packable_resources = {
	{"item", "coal",		{r=8,   g=8,   b=8}},
	{"item", "stone",		{r=192, g=192, b=192}},
	{"item", "copper-ore",	{r=218, g=106, b=67}},
	{"item", "iron-ore",	{r=127, g=169, b=194}},
	{"item", "solid-fuel",	{r=64,  g=64,  b=64}},
}

local mask_alpha		= 128
local crate_icon		= "__base__/graphics/icons/wooden-chest.png"
local crate_top_mask	= "__ThalStorage__/graphics/icons/wooden-chest-mask.png"
local crate_side_label	= "__base__/graphics/icons/wood.png"

local function generatePackedCrateIcon( itemData )
	local icons = {
		{
			icon = crate_icon,
			icon_size = 64,
		},
		{
			icon = crate_top_mask,
			icon_size = 32,
			tint = itemData[3]
		},
		{
			icon = copyData(itemData[1],itemData[2],'icon'),
			scale = 0.5,
		}
	}
	icons[2].tint.a = mask_alpha
	return icons
end

local function generateUnpackedCrateIcon( itemData )
	local icons = {
		{
			icon = "__ThalStorage__/graphics/icons/unpack-chest.png",
			icon_size = 32,
		},
		{
			icon = copyData(itemData[1],itemData[2],'icon'),
			icon_size = 32,
			scale = 0.4,
		}
	}
	return icons
end


for i=1, #packable_resources, 1 do
	local item = {
		type = "item",
		name = "compressed-"..packable_resources[i][2],
		localised_name = {"item-name.filled-crate", {"item-name." .. packable_resources[i][2]}},
		icons = generatePackedCrateIcon(packable_resources[i]),
		icon_size = 64,
		subgroup = "intermediate-product",
		order = "x["..packable_resources[i][2].."]",
		stack_size = 50
	}
	
	local packRecipe = {
		type = "recipe",
		name = "pack-"..packable_resources[i][2],
		localised_name = {"recipe-name.pack-crate", {"item-name." .. packable_resources[i][2]}},
		category = "advanced-crafting",
		subgroup = "pack-crate",
		order = "b[pack-" .. packable_resources[i][2] .. "]",
		energy_required = 1,
		enabled = false,
		icons = generatePackedCrateIcon(packable_resources[i]),
		icon_size = 64,
		ingredients =
		{
			{type=packable_resources[i][1], name=packable_resources[i][2], amount=copyData(packable_resources[i][1],packable_resources[i][2],"stack_size")},
			{type="item", name="wooden-chest", amount=1},
		},
		results=
		{
			{type="item", name="compressed-"..packable_resources[i][2], amount=1},
		},
	}
	
	local unpackRecipe = {
		type = "recipe",
		name = "unpack-"..packable_resources[i][2],
		localised_name = {"recipe-name.unpack-crate", {"item-name." .. packable_resources[i][2]}},
		category = "advanced-crafting",
		subgroup = "empty-crate",
		order = "c[unpack-" .. packable_resources[i][2] .. "]",
		energy_required = 1,
		enabled = false,
		icons=generateUnpackedCrateIcon(packable_resources[i]),
		icon_size = 32,
		ingredients =
		{
			{type="item", name="compressed-"..packable_resources[i][2], amount=1},
		},
		results=
		{
			{type=packable_resources[i][1], name=packable_resources[i][2], amount=copyData(packable_resources[i][1],packable_resources[i][2],"stack_size")},
			{type="item", name="wooden-chest", amount=1},
		},
	}
	
	data:extend({
		item,
		packRecipe,
		unpackRecipe
	})
	
	table.insert(data.raw["technology"]["warehouse-research"].effects,
    {
        type = "unlock-recipe",
        recipe = packRecipe.name,
    })
	table.insert(data.raw["technology"]["warehouse-research"].effects,
    {
        type = "unlock-recipe",
        recipe = unpackRecipe.name,
    })
end

data:extend({
	{
		type = "item-subgroup",
		name = "empty-crate",
		group = "intermediate-products",
		order = "e"
	},
	{
		type = "item-subgroup",
		name = "pack-crate",
		group = "intermediate-products",
		order = "e"
	},
})