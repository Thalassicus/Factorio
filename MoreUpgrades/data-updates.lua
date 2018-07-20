------------------
-- Technologies --
------------------

table.insert(data.raw["technology"]["gates"].effects,
    {
        type = "unlock-recipe",
        recipe = "big-stone-wall",
    })

table.insert(data.raw["technology"]["circuit-network"].effects,
    {
        type = "unlock-recipe",
        recipe = "circuit-pipe",
    })

table.insert(data.raw["technology"]["solar-energy"].effects,
    {
        type = "unlock-recipe",
        recipe = "radar-outpost",
    })
