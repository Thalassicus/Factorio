require "constants"


------------------
-- Technologies --
------------------

table.insert(data.raw["technology"]["circuit-network"].effects,
    {
        type = "unlock-recipe",
        ammo_category = "circuitpipe_recipe",
    })
