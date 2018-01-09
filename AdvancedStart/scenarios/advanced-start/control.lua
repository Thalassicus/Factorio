local silo_script = require("silo-script")
local version = 1

script.on_event(defines.events.on_player_created, function(event)
  local player = game.players[event.player_index]
  give_items(player)
  player.force.chart(player.surface, {{player.position.x - 200, player.position.y - 200}, {player.position.x + 200, player.position.y + 200}})
  if (#game.players <= 1) then
    game.show_message_dialog{text = {"msg-intro"}}
  else
    player.print({"msg-intro"})
  end
  silo_script.on_player_created(event)
end)


function give_items(player)
  local items =
  {
    ["iron-plate"] = "1000",
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
    ["firearm-magazine"] = "200",
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
end


script.on_event(defines.events.on_player_respawned, function(event)
  --local player = game.players[event.player_index]
  --player.insert{name="pistol", count=1}
  --player.insert{name="firearm-magazine", count=10}
end)

script.on_event(defines.events.on_gui_click, function(event)
  silo_script.on_gui_click(event)
end)

script.on_init(function()
  global.version = version
  silo_script.on_init()
end)

script.on_event(defines.events.on_rocket_launched, function(event)
  silo_script.on_rocket_launched(event)
end)

script.on_configuration_changed(function(event)
  if global.version ~= version then
    global.version = version
  end
  silo_script.on_configuration_changed(event)
end)

silo_script.add_remote_interface()
silo_script.add_commands()
