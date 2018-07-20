------------------
-- Technologies --
------------------

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
