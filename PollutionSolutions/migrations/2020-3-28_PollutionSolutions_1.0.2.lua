for _, force in pairs(game.forces) do
  local techs = force.technologies
  local recipes = force.recipes
  if techs["inceneration"].researched then
    recipes["toxic-waste-treatment"].enabled = true
    recipes["toxic-incinerator"].enabled = true
  end
end
