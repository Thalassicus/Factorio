local ratio_CollectorsToIncinerators = 4

local incinerator = util.table.deepcopy(data.raw['reactor']['nuclear-reactor'])
incinerator.name = "incinerator"
incinerator.order = "z"
incinerator.minable.result = "incinerator"
incinerator.consumption = "10MW"
incinerator.burner.fuel_category = "waste"
incinerator.burner.effectivity = 1
incinerator.burner.emissions = 100 / (10*1000)
incinerator.burner.smoke =
{
	{
		name = "incenerator-smoke",
		north_position = {0, 0},
		east_position = {0, 0},
		frequency = 10,
		starting_vertical_speed = 0.05,
		slow_down_factor = 1,
		starting_frame_deviation = 60,
	}
}

local inceneratorsmoke = 
	{
		type = "trivial-smoke",
		name = "incenerator-smoke",
		flags = {"not-on-map"},
		duration = 600,
		fade_in_duration = 0,
		fade_away_duration = 600,
		spread_duration = 600,
		start_scale = 1.5,
		end_scale = 2,
		color = {r = 0.2, g = 0.2, b = 0.2, a = 0.5},
		cyclic = true,
		affected_by_wind = true,
		animation =
		{
		  width = 152,
		  height = 120,
		  line_length = 5,
		  frame_count = 60,
		  axially_symmetrical = false,
		  direction_count = 1,
		  shift = {-0.53125, -0.4375},
		  priority = "high",
		  animation_speed = 0.25,
		  filename = "__base__/graphics/entity/smoke/smoke.png",
		  flags = { "smoke" }
		}
	}


incinerator.working_light_picture.filename="__PollutionControls__/graphics/entity/incinerator/reactor-lights-color.png"
incinerator.working_light_picture.hr_version.filename="__PollutionControls__/graphics/entity/incinerator/hr-reactor-lights-color.png"
incinerator.light.color={r=0.744, g=0.275, b=0.867}
incinerator.heat_buffer.max_temperature=200

local toxicturret = util.table.deepcopy(data.raw['fluid-turret']['flamethrower-turret'])
toxicturret.name = "toxic-turret"
toxicturret.order = "z"
toxicturret.minable.result = "toxic-turret"
toxicturret.attack_parameters.fluids = {
    {type = "toxicsludge"}
}
toxicturret.attack_parameters.fluid_consumption = 3.0
toxicturret.attack_parameters.ammo_type.action.action_delivery.stream = "toxic-flame-stream"
table.insert(toxicturret.resistances,
{
	type = "poison",
	percent = 100,
})
toxicturret.attack_parameters.ammo_type.action.action_delivery.duration = 60

local airfilter = util.table.deepcopy(data.raw['assembling-machine']['chemical-plant'])
airfilter.name = "airfilter"
airfilter.order = "z"
airfilter.minable.result = "airfilter"
airfilter.crafting_categories = {"pollution"}
airfilter.energy_source.emissions = 0
airfilter.energy_usage = "210kW"
airfilter.crafting_speed = 1
airfilter.ingredient_count = 1

airfilter.fluid_boxes =
{
	{
		production_type = "input",
		pipe_covers = pipecoverspictures(),
		base_area = 10,
		base_level = -1,
		filter = "polluted-air",
		pipe_connections = {}--{ type="input", position = {0, -2} }}
	},
	{
		production_type = "output",
		pipe_covers = pipecoverspictures(),
		base_level = 1,
		pipe_connections = {{ position = {-1, 2} }}
	},
	{
		production_type = "output",
		pipe_covers = pipecoverspictures(),
		base_level = 1,
		pipe_connections = {{ position = {1, 2} }}
	}
}

local lowheater = util.table.deepcopy(data.raw['boiler']['heat-exchanger'])
lowheater.name = "low-heat-exchanger"
lowheater.order = "z"
lowheater.minable.result = "low-heat-exchanger"
lowheater.target_temperature = 165
lowheater.icon = "__PollutionControls__/graphics/icons/low-heat-boiler.png"
lowheater.structure.north.layers[1].filename			=  "__PollutionControls__/graphics/entity/low-heat-exchanger/lowheatex-N-idle.png"
lowheater.structure.north.layers[1].hr_version.filename	=  "__PollutionControls__/graphics/entity/low-heat-exchanger/hr-lowheatex-N-idle.png"
lowheater.structure.east.layers[1].filename				=  "__PollutionControls__/graphics/entity/low-heat-exchanger/lowheatex-E-idle.png"
lowheater.structure.east.layers[1].hr_version.filename	=  "__PollutionControls__/graphics/entity/low-heat-exchanger/hr-lowheatex-E-idle.png"
lowheater.structure.south.layers[1].filename			=  "__PollutionControls__/graphics/entity/low-heat-exchanger/lowheatex-S-idle.png"
lowheater.structure.south.layers[1].hr_version.filename	=  "__PollutionControls__/graphics/entity/low-heat-exchanger/hr-lowheatex-S-idle.png"
lowheater.structure.west.layers[1].filename 			=  "__PollutionControls__/graphics/entity/low-heat-exchanger/lowheatex-W-idle.png"
lowheater.structure.west.layers[1].hr_version.filename	=  "__PollutionControls__/graphics/entity/low-heat-exchanger/hr-lowheatex-W-idle.png"

local emitter = util.table.deepcopy(data.raw['storage-tank']['storage-tank'])
emitter.name = "emitter"
emitter.order = "z"
emitter.minable.result = "emitter"
emitter.flags = {"placeable-neutral", "player-creation"}
emitter.corpse = "small-worm-corpse"
emitter.dying_explosion = "blood-explosion-big"
emitter.dying_sound = make_worm_dying_sounds(0.8)
emitter.icon = "__PollutionControls__/graphics/icons/toxicdump_icon.png"
emitter.light = {
	minimum_darkness = 0.8,
	intensity = 0.9,
	size = 40,
	color = {r=0.333, g=0.063, b=0.451}
}
emitter.fluid_box.pipe_connections ={
	{ position = {-2, 0} },
	{ position = {0, 2} },
	{ position = {2, 0} },
	{ position = {0, -2} },
}
emitter.fluid_box.filter = "toxicsludge"
emitter.fluid_box.base_area = 10
emitter.render_layer = "decorative"
emitter.pictures.picture.sheets = {
	{
		filename = "__PollutionControls__/graphics/entity/emitter/toxicdumpv2.png",
		frames = 1,
		width = 110,
		height = 108,
		scale = 1.0,
		shift = util.by_pixel(0, 4),
		priority = "extra-high",
		hr_version = {
			filename = "__PollutionControls__/graphics/entity/emitter/toxicdumpv2.png",
			frames = 1,
			width = 110,
			height = 108,
			scale = 1.0,
			shift = util.by_pixel(-0.25, 3.75),
			priority = "extra-high",
		},
	},
}
emitter.resistances = {
	{
		type = "poison",
		percent = 100,
	},
	{
		type = "explosion",
		percent = 100,
	},
	{
		type = "fire",
		percent = 100,
	}
}
emitter.collision_mask = { "item-layer", "object-layer", "water-tile"}

local dumpsmoke = util.table.deepcopy(data.raw['trivial-smoke']['smoke'])
dumpsmoke.name = "dump-smoke"
dumpsmoke.start_scale = 0.1
dumpsmoke.end_scale = 6.0
dumpsmoke.color = {r=0.744, g=0.275, b=0.867}
dumpsmoke.affected_by_wind = false


data:extend({
	airfilter,
	inceneratorsmoke,
	incinerator,
	toxicturret,
	lowheater,
	emitter,
	dumpsmoke,
})