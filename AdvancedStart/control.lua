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
    ["raw-wood"] = "100",
    ["coal"] = "100",
    ["stone"] = "100",
    ["stone-brick"] = "500",
    ["automation-science-pack"] = "400",
    ["big-electric-pole"] = "10",
    ["medium-electric-pole"] = "50",
    ["transport-belt"] = "100",
    ["submachine-gun"] = "1",
    ["firearm-magazine"] = "190",
    ["grenade"] = "50",
    ["steel-axe"] = "10",
    ["light-armor"] = "1",
	
    ["big-electric-pole"] = "50",
    ["firearm-magazine"] = "190",
    ["piercing-rounds-magazine"] = "200",
    ["modular-armor"] = "1",
    ["logistic-science-pack"] = "400",
    ["personal-roboport-equipment"] = "2",
    ["solar-panel-equipment"] = "15",
    ["battery-mk2-equipment"] = "1",
    ["basic-construction-robot"] = "50",
    ["steel-plate"] = "400",
    ["electronic-circuit"] = "400",
    ["fast-inserter"] = "200",
    ["long-handed-inserter"] = "100",
    ["pipe"] = "500",
    ["pipe-to-ground"] = "50",
    ["fast-transport-belt"] = "500",
    ["fast-underground-belt"] = "50",
    ["steel-furnace"] = "50",
    ["electric-mining-drill"] = "50",
    ["assembling-machine-2"] = "50",
    ["car"] = "1",
  }
  for name, count in pairs (items) do
    if game.item_prototypes[name] then
      player.insert{name = name, count = count}
    else
      error(name.." is not a valid item") --More useful than an assert
    end
  end
end)