local silo_script = require("silo-script")
local version = 1

script.on_event(defines.events.on_player_created, function(event)
  local player = game.players[event.player_index]
  local items =
  {
    ["iron-plate"] = "492",
    ["copper-plate"] = "500",
    ["iron-gear-wheel"] = "500",
    ["electronic-circuit"] = "400",
    ["wood"] = "50",
    ["coal"] = "100",
    ["stone"] = "100",
    ["stone-brick"] = "500",
    ["medium-electric-pole"] = "100",
    ["big-electric-pole"] = "50",
    ["submachine-gun"] = "1",
    ["piercing-rounds-magazine"] = "200",
	
    ["logistic-science-pack"] = "400",
    ["automation-science-pack"] = "400",
    ["steel-plate"] = "400",
    ["electronic-circuit"] = "400",
    ["inserter"] = "100",
    ["fast-inserter"] = "150",
    ["long-handed-inserter"] = "100",
    ["pipe"] = "100",
    ["pipe-to-ground"] = "50",
    ["steel-furnace"] = "50",
    ["electric-mining-drill"] = "50",
    ["assembling-machine-1"] = "50",

    ["transport-belt"] = "400",
    ["fast-transport-belt"] = "400",
    ["underground-belt"] = "100",
    ["fast-underground-belt"] = "50",
  }
  for name, count in pairs (items) do
    if game.item_prototypes[name] then
      player.insert{name = name, count = count}
    else
      error(name.." is not a valid item") --More useful than an assert
    end
  end
end)