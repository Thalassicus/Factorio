local noise = require("noise")
local tne = noise.to_noise_expression

-- Noise functions are unchanged from vanilla.

local function make_basis_noise_function(seed0,seed1,outscale0,inscale0)
  outscale0 = outscale0 or 1
  inscale0 = inscale0 or 1/outscale0
  return function(x,y,inscale,outscale)
    return tne{
      type = "function-application",
      function_name = "factorio-basis-noise",
      arguments = {
        x = tne(x),
        y = tne(y),
        seed0 = tne(seed0),
        seed1 = tne(seed1),
        input_scale = tne((inscale or 1) * inscale0),
        output_scale = tne((outscale or 1) * outscale0)
      }
    }
  end
end

local function make_multioctave_noise_function(seed0,seed1,octaves,octave_output_scale_multiplier,octave_input_scale_multiplier,output_scale0,input_scale0)
  octave_output_scale_multiplier = octave_output_scale_multiplier or 2
  octave_input_scale_multiplier = octave_input_scale_multiplier or 1 / octave_output_scale_multiplier
  return function(x,y,inscale,outscale)
    return tne{
      type = "function-application",
      function_name = "factorio-multioctave-noise",
      arguments = {
        x = tne(x),
        y = tne(y),
        seed0 = tne(seed0),
        seed1 = tne(seed1),
        input_scale = tne((inscale or 1) * (input_scale0 or 1)),
        output_scale = tne((outscale or 1) * (output_scale0 or 1)),
        octaves = tne(octaves),
        octave_output_scale_multiplier = tne(octave_output_scale_multiplier),
        octave_input_scale_multiplier = tne(octave_input_scale_multiplier),
      }
    }
  end
end

-- Returns a multioctave noise function where each octave's noise is multiplied by some other noise
-- by default 'some other noise' is the basis noise at 17x lower frequency,
-- normalized around 0.5 and clamped between 0 and 1
local function make_multioctave_modulated_noise_function(params)
  local seed0 = params.seed0 or 1
  local seed1 = params.seed1 or 1
  local octave_count = params.octave_count or 1
  local octave0_output_scale = params.octave0_output_scale or 1
  local octave0_input_scale = params.octave0_input_scale or 1
  local octave_output_scale_multiplier = params.octave_output_scale_multiplier or 2
  local octave_input_scale_multiplier = params.octave_input_scale_multiplier or 1/2
  local basis_noise_function = params.basis_noise_function or make_basis_noise_function(seed0, seed1)
  local modulation_noise_function = params.modulation_noise_function or function(x,y)
    return noise.clamp(basis_noise_function(x,y)+0.5, 0, 1)
  end
  -- input scale of modulation relative to each octave's base input scale
  local mris = params.modulation_relative_input_scale or 1/17
  
  return function(x,y)
    local outscale = octave0_output_scale
    local inscale = octave0_input_scale
    local result = 0
    
    for i=1,octave_count do
      local noise = basis_noise_function(x*inscale, y*inscale)
      local modulation = modulation_noise_function(x*(inscale*mris), y*(inscale*mris))
      result = result + (outscale * noise * modulation)
      
      outscale = outscale * octave_output_scale_multiplier
      inscale = inscale * octave_input_scale_multiplier
    end
    
    return result
  end
end

local function make_multioctave_noise_function(seed0,seed1,octaves,octave_output_scale_multiplier,octave_input_scale_multiplier,output_scale0,input_scale0)
  octave_output_scale_multiplier = octave_output_scale_multiplier or 2
  octave_input_scale_multiplier = octave_input_scale_multiplier or 1 / octave_output_scale_multiplier
  return function(x,y,inscale,outscale)
    return tne{
      type = "function-application",
      function_name = "factorio-multioctave-noise",
      arguments = {
        x = tne(x),
        y = tne(y),
        seed0 = tne(seed0),
        seed1 = tne(seed1),
        input_scale = tne((inscale or 1) * (input_scale0 or 1)),
        output_scale = tne((outscale or 1) * (output_scale0 or 1)),
        octaves = tne(octaves),
        octave_output_scale_multiplier = tne(octave_output_scale_multiplier),
        octave_input_scale_multiplier = tne(octave_input_scale_multiplier),
      }
    }
  end
end


local function make_split_multioctave_noise_function(seed0,seed1,octaveses,octave_output_scale_multiplier,octave_input_scale_multiplier,output_scale0,input_scale0)
  output_scale0 = output_scale0 or 1
  input_scale0 = input_scale0 or 1
  octave_output_scale_multiplier = octave_output_scale_multiplier or 1
  octave_input_scale_multiplier = octave_input_scale_multiplier or 1
  local funx = {}
  for i=1,#octaveses do
    funx[i] = make_multioctave_noise_function(seed0,seed1,octaveses[i],octave_output_scale_multiplier,octave_input_scale_multiplier,output_scale0,input_scale0)
    output_scale0 = output_scale0 * octave_output_scale_multiplier ^ octaveses[i]
    input_scale0  = input_scale0  * octave_input_scale_multiplier  ^ octaveses[i]
  end
  return funx
end


data.raw["noise-expression"]["default-elevation"].expression = noise.define_noise_function( function(x,y,tile,map)
	local plateau_octaves = 3
	local lf_octaves = 6
	-- Everyone except TOGoS (apparently) likes there to not be much water
	-- when water-level = 'normal', so shift the elevation up everywhere.
	-- Set water-level = 'high' or use 'large-seas-elevation' if you like oceans.
	local global_bias = 5

	x = x * map.segmentation_multiplier + 10000 -- Move the point where 'fractal similarity' is obvious off into the boonies
	y = y * map.segmentation_multiplier
	local rdi = tile.tier / 32 -- ridge distance-based influcence
	local high_ridge =	64 + rdi + noise.clamp(16 + rdi, 0, 32) * make_multioctave_noise_function(map.seed, 7, 2, 3)(x,y,1/256,1)
	local low_ridge	= -64 - rdi

	local plateau_noise = make_multioctave_noise_function(map.seed, 9, plateau_octaves, 1/3, 3, 4, 1/128)
	local plateaus = noise.max(make_basis_noise_function(map.seed, 10, 8, 1/128)(x,y) - 8, 3 - tile.tier)

	local high_freq_noise = make_multioctave_modulated_noise_function{
		seed0 = map.seed,
		seed1 = 11,
		octave_count = 6,
		octave0_output_scale = 1/8,
		octave0_input_scale = 1/4,
		octave_output_scale_multiplier = 2,
		octave_input_scale_multiplier = 1/3,
	}
	local low_freq_noise = make_multioctave_modulated_noise_function{
		seed0 = map.seed,
		seed1 = 8,
		octave_count = lf_octaves,
		octave0_output_scale = 1,
		octave0_input_scale = 1/8,
	}
	local very_low_freq_noise = make_basis_noise_function(map.seed, 9, 16, 1/128)
	local basis = low_freq_noise(x,y) + very_low_freq_noise(x,y)
	local ridged1 = noise.ridge(basis, low_ridge, high_ridge)
	
	local normal = noise.max(ridged1 + high_freq_noise(x,y), plateaus + plateau_noise(x,y)) + global_bias
	
	-- Multily elevation by low-frequency noise to make hilly and non-hilly areas
	local hill_modulation = noise.clamp(make_multioctave_noise_function(map.seed, 12, 4, 4, 1)(x,y,1/256,3/4) - 2, 0.1, 1.0)

	-- Elevation below which hill modulation has no effect.
	-- Set to slightly above the water level so that flat plains don't all become a giant beach/sandbar thing.
	-- To do its job it just has to be lower than the first row of cliffs.
	local hill_modulation_identity = map.finite_water_level + 3
	
	return 2 * noise.min(normal, hill_modulation * (normal - hill_modulation_identity) + hill_modulation_identity)
end)
