local tier2radar = util.table.deepcopy(data.raw['radar']['radar'])
tier2radar.name = "radar-outpost"
tier2radar.order = "z"
tier2radar.minable.result = "radar-outpost"
tier2radar.energy_per_sector = "33.3333333J" --"10MJ"
tier2radar.energy_per_nearby_scan = "0.00000000001J" --"250kJ"
tier2radar.energy_usage = "1W"
tier2radar.energy_source.buffer_capacity = "10GJ"
tier2radar.energy_source.usage_priority = "terciary"
tier2radar.energy_source.input_flow_limit = "0kW"
tier2radar.energy_source.output_flow_limit = "0kW"
tier2radar.energy_source.drain = "0kW"
tier2radar.energy_source.render_no_power_icon = false
tier2radar.energy_source.render_no_network_icon = false
tier2radar.integration_patch.hr_version = nil
tier2radar.pictures = {
	layers = {
		{
			filename = "__MoreUpgrades__/graphics/solar-panel_anim.png",
			priority = "high",
			width = 153,
			height = 131,
			direction_count = 64,
			line_length = 8,
			shift = util.by_pixel(12.5,0),
			--scale = 0.8,
		},
				{
					filename = "__base__/graphics/entity/radar/radar.png",
					priority = "low",
					width = 98,
					height = 128,
					apply_projection = false,
					direction_count = 64,
					line_length = 8,
					shift = util.by_pixel(1, -16),
					hr_version = nil
				},
				{
					filename = "__base__/graphics/entity/radar/radar-shadow.png",
					priority = "low",
					width = 172,
					height = 94,
					apply_projection = false,
					direction_count = 64,
					line_length = 8,
					shift = util.by_pixel(39,3),
					draw_as_shadow = true,
					hr_version = nil
				}
	}
}
tier2radar.collision_box = {{-1.9, -1.9}, {1.9, 1.9}}
tier2radar.selection_box = {{-2, -2}, {2, 2}}

--[[
local circuitpipe = util.table.deepcopy(data.raw['pipe']['pipe'])
circuitpipe.type = "storage-tank"
circuitpipe.name = "circuit-pipe"
circuitpipe.base_area = 10
circuitpipe.circuit_wire_connection_point = circuit_connector_definitions["chest"].points
circuitpipe.circuit_connector_sprites = circuit_connector_definitions["chest"].sprites
circuitpipe.circuit_wire_max_distance = default_circuit_wire_max_distance
circuitpipe.window_bounding_box = {{-0.28125, -0.5}, {0.03125, 0.125}}
--]]

local circuitpipe = util.table.deepcopy(data.raw['storage-tank']['storage-tank'])
circuitpipe.name = "circuit-pipe"
circuitpipe.icon = "__base__/graphics/icons/pipe.png"
circuitpipe.icon_size = 32
circuitpipe.flags = {"placeable-neutral", "player-creation"}
circuitpipe.minable = {hardness = 0.2, mining_time = 0.5, result = "circuit-pipe"}
circuitpipe.max_health = 100
circuitpipe.corpse = "small-remnants"
circuitpipe.resistances =
{
	{
		type = "fire",
		percent = 80
	},
	{
		type = "impact",
		percent = 30
	}
}
circuitpipe.fast_replaceable_group = "pipe"
circuitpipe.collision_box = {{-0.29, -0.29}, {0.29, 0.29}}
circuitpipe.selection_box = {{-0.5, -0.5}, {0.5, 0.5}}
circuitpipe.fluid_box =
{
	base_area = 1,
	pipe_covers = data.raw['storage-tank']['storage-tank'].fluid_box.pipe_covers,
	pipe_connections =
	{
		{ position = {0, -1} },
		{ position = {1, 0} },
		{ position = {0, 1} },
		{ position = {-1, 0} }
	},
}
circuitpipe.vehicle_impact_sound =	{ filename = "__base__/sound/car-metal-impact.ogg", volume = 0.65 }
circuitpipe.pictures.picture.sheets[1].filename = "__base__/graphics/entity/pipe/pipe-cross.png"
circuitpipe.pictures.picture.sheets[1].frames = 1
circuitpipe.pictures.picture.sheets[1].width = 64
circuitpipe.pictures.picture.sheets[1].height = 64
circuitpipe.pictures.picture.sheets[1].shift = nil
circuitpipe.pictures.picture.sheets[1].hr_version.filename = "__base__/graphics/entity/pipe/hr-pipe-cross.png"
circuitpipe.pictures.picture.sheets[1].hr_version.frames = 1
circuitpipe.pictures.picture.sheets[1].hr_version.width = 128
circuitpipe.pictures.picture.sheets[1].hr_version.height = 128
circuitpipe.pictures.picture.sheets[1].hr_version.shift = nil
circuitpipe.pictures.picture.sheets[2] = nil
circuitpipe.pictures.fluid_background.width = 1
circuitpipe.pictures.fluid_background.height = 1
circuitpipe.pictures.window_background.width = 1
circuitpipe.pictures.window_background.height = 1
circuitpipe.pictures.window_background.hr_version.width = 1
circuitpipe.pictures.window_background.hr_version.height = 1
circuitpipe.pictures.flow_sprite.width = 1
circuitpipe.pictures.flow_sprite.height = 1
circuitpipe.pictures.gas_flow.width = 1
circuitpipe.pictures.gas_flow.height = 1
circuitpipe.pictures.gas_flow.hr_version.width = 1
circuitpipe.pictures.gas_flow.hr_version.height = 1


circuitpipe.working_sound =
{
	sound = {
		{
			filename = "__base__/sound/pipe.ogg",
			volume = 0.85
		},
	},
	match_volume_to_activity = true,
	max_sounds_per_type = 3
}
circuitpipe.circuit_wire_connection_points = circuit_connector_definitions["inserter"].points
circuitpipe.circuit_connector_sprites = circuit_connector_definitions["inserter"].sprites


local bigwall = util.table.deepcopy(data.raw['wall']['stone-wall'])
bigwall.name = "big-stone-wall"
bigwall.order = "z"
bigwall.minable.result = "big-stone-wall"
bigwall.icon = "__MoreUpgrades__/graphics/icons/big-wall_icon.png"
bigwall.max_health = data.raw['wall']['stone-wall'].max_health * 8
bigwall.collision_box = {{-0.9, -0.9}, {0.9, 0.9}}
bigwall.selection_box = {{-1.0, -1.0}, {1.0, 1.0}}

local scale = 1.1
local shift = -0.2
local shadowshift = {0.1, 0.0}

bigwall.pictures.single.layers[1].filename = "__MoreUpgrades__/graphics/entity/bigwall/big-wall-single.png"
bigwall.pictures.single.layers[1].width = 64
bigwall.pictures.single.layers[1].height = 88
bigwall.pictures.single.layers[2].filename = "__MoreUpgrades__/graphics/entity/bigwall/big-wall-single-shadow.png"
bigwall.pictures.single.layers[2].width = 93
bigwall.pictures.single.layers[2].height = 78
for l=1,#bigwall.pictures.single.layers,1 do
	bigwall.pictures.single.layers[l].scale = scale
	if l==1 then
		bigwall.pictures.single.layers[l].shift[2] = bigwall.pictures.single.layers[l].shift[2] + shift
	end
	if l==2 then
		bigwall.pictures.single.layers[l].shift[1] = bigwall.pictures.single.layers[l].shift[1] + shadowshift[1]
		bigwall.pictures.single.layers[l].shift[2] = bigwall.pictures.single.layers[l].shift[2] + shadowshift[2]
	end
end
for i=1,#bigwall.pictures.straight_vertical,1 do
	bigwall.pictures.straight_vertical[i].layers = nil
	bigwall.pictures.straight_vertical[i].layers = bigwall.pictures.single.layers
	--for l=1,#bigwall.pictures.straight_vertical[i].layers,1 do
		--bigwall.pictures.straight_vertical[i].layers[l] = bigwall.pictures.single.layers[l]
		--bigwall.pictures.straight_vertical[i].layers[l].scale = scale
		--bigwall.pictures.straight_vertical[i].layers[l].shift[2] = bigwall.pictures.straight_vertical[i].layers[l].shift[2] + shift
	--end
end

for i=1,#bigwall.pictures.straight_horizontal,1 do
	bigwall.pictures.straight_horizontal[i].layers = nil
	bigwall.pictures.straight_horizontal[i].layers = bigwall.pictures.single.layers
	--for l=1,#bigwall.pictures.straight_horizontal[i].layers,1 do
		--bigwall.pictures.straight_horizontal[i].layers[l] = bigwall.pictures.single.layers[l]
		--bigwall.pictures.straight_horizontal[i].layers[l].scale = scale
		--bigwall.pictures.straight_horizontal[i].layers[l].shift[2] = bigwall.pictures.straight_horizontal[i].layers[l].shift[2] + shift
	--end
end
bigwall.pictures.corner_right_down.layers = nil
bigwall.pictures.corner_right_down.layers = bigwall.pictures.single.layers
--for l=1,#bigwall.pictures.corner_right_down.layers,1 do
	--bigwall.pictures.corner_right_down.layers[l] = bigwall.pictures.single.layers[l]
	--bigwall.pictures.corner_right_down.layers[l].scale = scale
	--bigwall.pictures.corner_right_down.layers[l].shift[2] = bigwall.pictures.corner_right_down.layers[l].shift[2] + shift
--end
bigwall.pictures.corner_left_down.layers = nil
bigwall.pictures.corner_left_down.layers = bigwall.pictures.single.layers
--for l=1,#bigwall.pictures.corner_left_down.layers,1 do
	--bigwall.pictures.corner_left_down.layers[l] = bigwall.pictures.single.layers[l]
	--bigwall.pictures.corner_left_down.layers[l].scale = scale
	--bigwall.pictures.corner_left_down.layers[l].shift[2] = bigwall.pictures.corner_left_down.layers[l].shift[2] + shift
--end
bigwall.pictures.t_up.layers = nil
bigwall.pictures.t_up.layers = bigwall.pictures.single.layers
--for l=1,#bigwall.pictures.t_up.layers,1 do
	--bigwall.pictures.t_up.layers[l] = bigwall.pictures.single.layers[l]
	--bigwall.pictures.t_up.layers[l].scale = scale
	--bigwall.pictures.t_up.layers[l].shift[2] = bigwall.pictures.t_up.layers[l].shift[2] + shift
--end
bigwall.pictures.ending_right.layers = nil
bigwall.pictures.ending_right.layers = bigwall.pictures.single.layers
--for l=1,#bigwall.pictures.ending_right.layers,1 do
	--bigwall.pictures.ending_right.layers[l] = bigwall.pictures.single.layers[l]
	--bigwall.pictures.ending_right.layers[l].scale = scale
	--bigwall.pictures.ending_right.layers[l].shift[2] = bigwall.pictures.ending_right.layers[l].shift[2] + shift
--end
bigwall.pictures.ending_left.layers = nil
bigwall.pictures.ending_left.layers = bigwall.pictures.single.layers
--for l=1,#bigwall.pictures.ending_left.layers,1 do
	--bigwall.pictures.ending_left.layers[l] = bigwall.pictures.single.layers[l]
	--bigwall.pictures.ending_left.layers[l].scale = scale
	--bigwall.pictures.ending_left.layers[l].shift[2] = bigwall.pictures.ending_left.layers[l].shift[2] + shift
--end

bigwall.pictures.water_connection_patch =
{
	sheets =
	{
		{
			filename = "__base__/graphics/entity/stone-wall/wall-patch.png",
			priority = "extra-high",
			width = 52,
			height = 68,
			shift = util.by_pixel(0, -2),
			scale = scale,
		},
		{
			filename = "__base__/graphics/entity/stone-wall/wall-patch-shadow.png",
			priority = "extra-high",
			draw_as_shadow = true,
			width = 74,
			height = 96,
			shift = util.by_pixel(6, 13),
			scale = scale,
		}
	}
}
bigwall.pictures.water_connection_patch.sheets[1].shift[2] = bigwall.pictures.water_connection_patch.sheets[1].shift[2] + shift
bigwall.pictures.water_connection_patch.sheets[2].shift[1] = bigwall.pictures.water_connection_patch.sheets[2].shift[1] + shadowshift[1]
bigwall.pictures.water_connection_patch.sheets[2].shift[2] = bigwall.pictures.water_connection_patch.sheets[2].shift[2] + shadowshift[2]

--[[
bigwall.pictures.water_connection_patch.sheets = {
	{
		filename = "__base__/graphics/entity/stone-wall/wall-single.png",
		priority = "extra-high",
		width = 22,
		height = 42,
		shift = {0, -0.15625},
		scale = scale,
	},
	{
		filename = "__base__/graphics/entity/stone-wall/wall-single-shadow.png",
		priority = "extra-high",
		draw_as_shadow = true,
		width = 47,
		height = 32,
		shift = {0.359375, 0.5},
		scale = scale,
	}
}
bigwall.pictures.water_connection_patch.sheets[1].shift[2] = bigwall.pictures.water_connection_patch.sheets[1].shift[2] + shift
bigwall.pictures.water_connection_patch.sheets[2].shift[1] = bigwall.pictures.water_connection_patch.sheets[2].shift[1] + shadowshift[1]
bigwall.pictures.water_connection_patch.sheets[2].shift[2] = bigwall.pictures.water_connection_patch.sheets[2].shift[2] + shadowshift[2]
--]]

--for l=1,#bigwall.pictures.water_connection_patch.sheets,1 do
	--bigwall.pictures.water_connection_patch.sheets[l] = bigwall.pictures.single.layers[l]
	--bigwall.pictures.water_connection_patch.sheets[l].scale = scale
	--bigwall.pictures.water_connection_patch.sheets[l].shift[2] = bigwall.pictures.water_connection_patch.sheets[l].shift[2] + shift
--end
bigwall.wall_diode_green.scale = scale
bigwall.wall_diode_green.shift[2] = bigwall.wall_diode_green.shift[2] + shift
bigwall.wall_diode_green_light.scale = scale
bigwall.wall_diode_green_light.shift[2] = bigwall.wall_diode_green_light.shift[2] + shift
bigwall.wall_diode_red.scale = scale
bigwall.wall_diode_red.shift[2] = bigwall.wall_diode_red.shift[2] + shift
bigwall.wall_diode_red_light.scale = scale
bigwall.wall_diode_red_light.shift[2] = bigwall.wall_diode_red_light.shift[2] + shift

--bigwall.pictures.single.layers[2].shift[1] = bigwall.pictures.single.layers[2].shift[1] + shadowshift[1]
--bigwall.pictures.single.layers[2].shift[2] = bigwall.pictures.single.layers[2].shift[2] + shadowshift[2]





data:extend({
	tier2radar,
	bigwall,
	circuitpipe,
})