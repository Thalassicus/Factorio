local silo_script = require("silo-script")
local version = 1

script.on_event(defines.events.on_player_created, function(event)
  local player = game.players[event.player_index]
  local items =
  {
    ["iron-plate"] = "992",
    ["copper-plate"] = "1000",
    ["iron-gear-wheel"] = "500",
    ["electronic-circuit"] = "400",
    ["raw-wood"] = "100",
    ["coal"] = "100",
    ["stone"] = "100",
    ["stone-brick"] = "500",
    ["science-pack-1"] = "600",
    ["big-electric-pole"] = "10",
    ["medium-electric-pole"] = "10",
    ["transport-belt"] = "100",
    ["medium-electric-pole"] = "10",
    ["transport-belt"] = "100",
    ["submachine-gun"] = "1",
    ["firearm-magazine"] = "190",
    ["grenade"] = "50",
    ["steel-axe"] = "10",
    ["light-armor"] = "1",
  }
  for name, count in pairs (items) do
    if game.item_prototypes[name] then
      player.insert{name = name, count = count}
    else
      error(name.." is not a valid item") --More useful than an assert
    end
  end
end)