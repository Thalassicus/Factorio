require "constants"

data:extend({
	{
		type = "damage-type",
		name = "toxic",
	},
})

local fireutil = {}

function fireutil.foreach(table_, fun_)
  for k, tab in pairs(table_) do fun_(tab) end
  return table_
end

function fireutil.create_fire_pictures(opts)
  local fire_blend_mode = opts.blend_mode or "additive"
  local fire_animation_speed = opts.animation_speed or 0.5
  local fire_scale =  opts.scale or 1
  local fire_tint = {r=1,g=1,b=1,a=1}
  local fire_flags = { "compressed" }
  local retval = {
    { 
      filename = "__PollutionControls__/graphics/entity/fire-flame/fire-flame-13.png",
      line_length = 8,
      width = 60,
      height = 118,
      frame_count = 25,
      axially_symmetrical = false,
      direction_count = 1,
      blend_mode = fire_blend_mode,
      animation_speed = fire_animation_speed,
      scale = fire_scale,
      tint = fire_tint,
      flags = fire_flags,
      shift = { -0.0390625, -0.90625 }
    },
    { 
      filename = "__PollutionControls__/graphics/entity/fire-flame/fire-flame-12.png",
      line_length = 8,
      width = 63,
      height = 116,
      frame_count = 25,
      axially_symmetrical = false,
      direction_count = 1,
      blend_mode = fire_blend_mode,
      animation_speed = fire_animation_speed,
      scale = fire_scale,
      tint = fire_tint,
      flags = fire_flags,
      shift = { -0.015625, -0.914065 }
    },
    { 
      filename = "__PollutionControls__/graphics/entity/fire-flame/fire-flame-11.png",
      line_length = 8,
      width = 61,
      height = 122,
      frame_count = 25,
      axially_symmetrical = false,
      direction_count = 1,
      blend_mode = fire_blend_mode,
      animation_speed = fire_animation_speed,
      scale = fire_scale,
      tint = fire_tint,
      flags = fire_flags,
      shift = { -0.0078125, -0.90625 }
    },
    { 
      filename = "__PollutionControls__/graphics/entity/fire-flame/fire-flame-10.png",
      line_length = 8,
      width = 65,
      height = 108,
      frame_count = 25,
      axially_symmetrical = false,
      direction_count = 1,
      blend_mode = fire_blend_mode,
      animation_speed = fire_animation_speed,
      scale = fire_scale,
      tint = fire_tint,
      flags = fire_flags,
      shift = { -0.0625, -0.64844 }
    },
    { 
      filename = "__PollutionControls__/graphics/entity/fire-flame/fire-flame-09.png",
      line_length = 8,
      width = 64,
      height = 101,
      frame_count = 25,
      axially_symmetrical = false,
      direction_count = 1,
      blend_mode = fire_blend_mode,
      animation_speed = fire_animation_speed,
      scale = fire_scale,
      tint = fire_tint,
      flags = fire_flags,
      shift = { -0.03125, -0.695315 }
    },
    { 
      filename = "__PollutionControls__/graphics/entity/fire-flame/fire-flame-08.png",
      line_length = 8,
      width = 50,
      height = 98,
      frame_count = 32,
      axially_symmetrical = false,
      direction_count = 1,
      blend_mode = fire_blend_mode,
      animation_speed = fire_animation_speed,
      scale = fire_scale,
      tint = fire_tint,
      flags = fire_flags,
      shift = { -0.0546875, -0.77344 }
    },
    { 
      filename = "__PollutionControls__/graphics/entity/fire-flame/fire-flame-07.png",
      line_length = 8,
      width = 54,
      height = 84,
      frame_count = 32,
      axially_symmetrical = false,
      direction_count = 1,
      blend_mode = fire_blend_mode,
      animation_speed = fire_animation_speed,
      scale = fire_scale,
      tint = fire_tint,
      flags = fire_flags,
      shift = { 0.015625, -0.640625 }
    },
    { 
      filename = "__PollutionControls__/graphics/entity/fire-flame/fire-flame-06.png",
      line_length = 8,
      width = 65,
      height = 92,
      frame_count = 32,
      axially_symmetrical = false,
      direction_count = 1,
      blend_mode = fire_blend_mode,
      animation_speed = fire_animation_speed,
      scale = fire_scale,
      tint = fire_tint,
      flags = fire_flags,
      shift = { 0, -0.83594 }
    },
    { 
      filename = "__PollutionControls__/graphics/entity/fire-flame/fire-flame-05.png",
      line_length = 8,
      width = 59,
      height = 103,
      frame_count = 32,
      axially_symmetrical = false,
      direction_count = 1,
      blend_mode = fire_blend_mode,
      animation_speed = fire_animation_speed,
      scale = fire_scale,
      tint = fire_tint,
      flags = fire_flags,
      shift = { 0.03125, -0.882815 }
    },
    { 
      filename = "__PollutionControls__/graphics/entity/fire-flame/fire-flame-04.png",
      line_length = 8,
      width = 67,
      height = 130,
      frame_count = 32,
      axially_symmetrical = false,
      direction_count = 1,
      blend_mode = fire_blend_mode,
      animation_speed = fire_animation_speed,
      scale = fire_scale,
      tint = fire_tint,
      flags = fire_flags,
      shift = { 0.015625, -1.109375 }
    },
    { 
      filename = "__PollutionControls__/graphics/entity/fire-flame/fire-flame-03.png",
      line_length = 8,
      width = 74,
      height = 117,
      frame_count = 32,
      axially_symmetrical = false,
      direction_count = 1,
      blend_mode = fire_blend_mode,
      animation_speed = fire_animation_speed,
      scale = fire_scale,
      tint = fire_tint,
      flags = fire_flags,
      shift = { 0.046875, -0.984375 }
    },
    { 
      filename = "__PollutionControls__/graphics/entity/fire-flame/fire-flame-02.png",
      line_length = 8,
      width = 74,
      height = 114,
      frame_count = 32,
      axially_symmetrical = false,
      direction_count = 1,
      blend_mode = fire_blend_mode,
      animation_speed = fire_animation_speed,
      scale = fire_scale,
      tint = fire_tint,
      flags = fire_flags,
      shift = { 0.0078125, -0.96875 }
    },
    { 
      filename = "__PollutionControls__/graphics/entity/fire-flame/fire-flame-01.png",
      line_length = 8,
      width = 66,
      height = 119,
      frame_count = 32,
      axially_symmetrical = false,
      direction_count = 1,
      blend_mode = fire_blend_mode,
      animation_speed = fire_animation_speed,
      scale = fire_scale,
      tint = fire_tint,
      flags = fire_flags,
      shift = { -0.0703125, -1.039065 }
    },
  }
  return fireutil.foreach(retval, function(tab)
    if tab.shift and tab.scale then tab.shift = { tab.shift[1] * tab.scale, tab.shift[2] * tab.scale } end
  end)
end

function fireutil.create_small_tree_flame_animations(opts)
  local fire_blend_mode = opts.blend_mode or "additive"
  local fire_animation_speed = opts.animation_speed or 0.5
  local fire_scale =  opts.scale or 1
  local fire_tint = {r=1,g=1,b=1,a=1}
  local fire_flags = { "compressed" }
  local retval = {
    {
      filename = "__PollutionControls__/graphics/entity/fire-flame/tree-fire-flame-01-a.png",
      line_length = 8,
      width = 38,
      height = 110,
      frame_count = 32,
      axially_symmetrical = false,
      direction_count = 1,
      shift = {-0.03125, -1.5},
      blend_mode = fire_blend_mode,
      animation_speed = fire_animation_speed,
      scale = fire_scale,
      tint = fire_tint,
      flags = fire_flags
    },
    {
      filename = "__PollutionControls__/graphics/entity/fire-flame/tree-fire-flame-01-b.png",
      line_length = 8,
      width = 39,
      height = 111,
      frame_count = 32,
      axially_symmetrical = false,
      direction_count = 1,
      shift = {-0.078125, -1.51562},
      blend_mode = fire_blend_mode,
      animation_speed = fire_animation_speed,
      scale = fire_scale,
      tint = fire_tint,
      flags = fire_flags
    },
    {
      filename = "__PollutionControls__/graphics/entity/fire-flame/tree-fire-flame-01-c.png",
      line_length = 8,
      width = 44,
      height = 108,
      frame_count = 32,
      axially_symmetrical = false,
      direction_count = 1,
      shift = {-0.15625, -1.5},
      blend_mode = fire_blend_mode,
      animation_speed = fire_animation_speed,
      scale = fire_scale,
      tint = fire_tint,
      flags = fire_flags
    },
    { 
      filename = "__PollutionControls__/graphics/entity/fire-flame/tree-fire-flame-03-a.png",
      line_length = 8,
      width = 38,
      height = 110,
      frame_count = 23,
      axially_symmetrical = false,
      direction_count = 1,
      shift = {-0.03125, -1.5},
      blend_mode = fire_blend_mode,
      animation_speed = fire_animation_speed,
      scale = fire_scale,
      tint = fire_tint,
      flags = fire_flags
    },
    { 
      filename = "__PollutionControls__/graphics/entity/fire-flame/tree-fire-flame-03-b.png",
      line_length = 8,
      width = 34,
      height = 98,
      frame_count = 23,
      axially_symmetrical = false,
      direction_count = 1,
      shift = {-0.03125, -1.34375},
      blend_mode = fire_blend_mode,
      animation_speed = fire_animation_speed,
      scale = fire_scale,
      tint = fire_tint,
      flags = fire_flags
    },
    { 
      filename = "__PollutionControls__/graphics/entity/fire-flame/tree-fire-flame-03-c.png",
      line_length = 8,
      width = 39,
      height = 111,
      frame_count = 23,
      axially_symmetrical = false,
      direction_count = 1,
      shift = {-0.078125, -1.51562},
      blend_mode = fire_blend_mode,
      animation_speed = fire_animation_speed,
      scale = fire_scale,
      tint = fire_tint,
      flags = fire_flags
    }
  }
  
  return fireutil.foreach(retval, function(tab)
    if tab.shift and tab.scale then tab.shift = { tab.shift[1] * tab.scale, tab.shift[2] * tab.scale } end
  end)
end

local toxicflame = util.table.deepcopy(data.raw['stream']['flamethrower-fire-stream'])
toxicflame.name = "toxic-flame-stream"
toxicflame.spine_animation.filename = "__PollutionControls__/graphics/entity/flamethrower-fire-stream/flamethrower-fire-stream-spine.png"
toxicflame.particle.filename = "__PollutionControls__/graphics/entity/flamethrower-fire-stream/flamethrower-explosion.png"
toxicflame.action[2].action_delivery.target_effects[1].entity_name = "toxic-fire"
toxicflame.action[1].action_delivery.target_effects[1].sticker = "toxic-sticker"
toxicflame.action[1].action_delivery.target_effects[2].damage.type = POLLUTION_DAMAGE_TYPE
toxicflame.particle_horizontal_speed = data.raw['stream']['flamethrower-fire-stream'].particle_horizontal_speed * 1.75

local firetoxic = util.table.deepcopy(data.raw['fire']['fire-flame'])
firetoxic.name = "toxic-fire"
firetoxic.damage_per_tick.type = POLLUTION_DAMAGE_TYPE
firetoxic.pictures = fireutil.create_fire_pictures({ blend_mode = "normal", animation_speed = 1, scale = 0.5})
firetoxic.spawn_entity = "toxic-flame-on-tree"
firetoxic.emissions_per_tick = 0.5 -- default: 0.005
firetoxic.maximum_spread_count=0
firetoxic.damage_per_tick.amount = 6 / TICKS_PER_SECOND

local toxicsticker = util.table.deepcopy(data.raw['sticker']['fire-sticker'])
toxicsticker.name = "toxic-sticker"
--toxicsticker.animation.tint = {r=0.333, g=0.063, b=0.451, a=0.001}
toxicsticker.color = {r=0.333, g=0.063, b=0.451, a=0.001}
toxicsticker.damage_per_tick.type = POLLUTION_DAMAGE_TYPE
toxicsticker.spread_fire_entity = "toxic-flame-on-tree"
toxicsticker.fire_spread_cooldown=10--*TICKS_PER_SECOND
toxicsticker.fire_spread_radius=0

local firetoxicontree = util.table.deepcopy(data.raw['fire']['fire-flame-on-tree'])
firetoxicontree.name = "toxic-flame-on-tree"
firetoxicontree.damage_per_tick.type = POLLUTION_DAMAGE_TYPE
firetoxicontree.spawn_entity = "toxic-flame-on-tree"
firetoxicontree.small_tree_fire_pictures = fireutil.create_small_tree_flame_animations({ blend_mode = "additive", animation_speed = 0.5, scale = 0.7 * 0.75 })
firetoxicontree.pictures = fireutil.create_fire_pictures({ blend_mode = "additive", animation_speed = 1, scale = 0.5 * 1.25})
firetoxicontree.tree_dying_factor=0
firetoxicontree.maximum_spread_count = 0
firetoxicontree.fade_in_duration = 0
firetoxicontree.fade_out_duration = 0

local toxicslowdownsticker = util.table.deepcopy(data.raw['sticker']['slowdown-sticker'])
toxicslowdownsticker.name = "toxic-slowdown-sticker"
toxicslowdownsticker.duration_in_ticks = 2*TICKS_PER_SECOND

local toxiccloud_small = util.table.deepcopy(data.raw['smoke-with-trigger']['poison-cloud'])
toxiccloud_small.name = "toxic-cloud-small"
toxiccloud_small.affected_by_wind = false
toxiccloud_small.animation = {
	layers = {
		--[[{
			filename = "__PollutionControls__/graphics/entity/cloud/toxicwaste_overlay.png",
			flags = { "compressed" },
			priority = "low",
			width = 256,
			height = 256,
			frame_count = 45,
			animation_speed = 0.25,
			line_length = 7,
			scale = 2,
			draw_as_shadow = false,
		},--]]
		{
			filename = "__PollutionControls__/graphics/entity/cloud/toxicwaste.png",
			flags = { "compressed" },
			priority = "low",
			width = 256,
			height = 256,
			frame_count = 45,
			animation_speed = 0.25,
			line_length = 7,
			scale = 2,
			draw_as_shadow = true,
		}
	}
}
--toxiccloud_small.animation.scale = 2
--toxiccloud_small.animation.animation_speed = 0.25
--toxiccloud_small.animation.filename = "__PollutionControls__/graphics/entity/cloud/toxicwaste.png"

--toxiccloud_small.render_layer = "decorative"
toxiccloud_small.cyclic = true
toxiccloud_small.duration = 30 * TICKS_PER_SECOND + 1
toxiccloud_small.fade_in_duration =  2 * TICKS_PER_SECOND --the game appears to ignore fade_in_duration
toxiccloud_small.fade_away_duration = 1
toxiccloud_small.spread_duration = 0
toxiccloud_small.action.action_delivery.target_effects.action.radius = 6
toxiccloud_small.color = {r=1.0, g=1.0, b=1.0}
toxiccloud_small.action.action_delivery.target_effects.action.action_delivery.target_effects = {
	{
		type = "damage",
		damage = { amount = 2, type = POLLUTION_DAMAGE_TYPE}
	},
	{
		type = "create-sticker",
		sticker = "toxic-slowdown-sticker"
	}
}

local toxiccloud_medium = util.table.deepcopy(toxiccloud_small)
toxiccloud_medium.name = "toxic-cloud-medium"
toxiccloud_medium.animation.layers[1].scale = 3
--toxiccloud_medium.animation.layers[2].scale = 3
toxiccloud_medium.action.action_delivery.target_effects.action.action_delivery.target_effects[1].damage.amount = 4
toxiccloud_medium.action.action_delivery.target_effects.action.radius = 9


local toxiccloud_large = util.table.deepcopy(toxiccloud_small)
toxiccloud_large.name = "toxic-cloud-large"
toxiccloud_large.animation.layers[1].scale = 4
--toxiccloud_large.animation.layers[2].scale = 4
toxiccloud_large.action.action_delivery.target_effects.action.action_delivery.target_effects[1].damage.amount = 8
toxiccloud_large.action.action_delivery.target_effects.action.radius = 12


data:extend({
	toxicflame,
	toxicsticker,
	firetoxic,
	firetoxicontree,
	toxicslowdownsticker,
	toxiccloud_small,
	toxiccloud_medium,
	toxiccloud_large,
})