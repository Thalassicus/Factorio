--=========--
-- Control --
--=========--
TICKS_PER_SECOND                = 60

TOXIC_DUMP_NAME                  = 'dump-site'
TOXIC_DUMP_INTERVAL              = 30 * TICKS_PER_SECOND  -- dump pollution every # seconds
TOXIC_DUMP_FILLPERCENT           = 0.0                    -- 0.5 When the toxic dump contains more than this percent of it's total capacity, release gas
TOXIC_DUMP_MAX_RELEASED          = 1.0                    -- 0.25 The maximum percentage of toxic sludge that can be released in one take
TOXIC_DUMP_SLUDGE_PER_SEC        = 5                      -- the amount of toxic sludge to remove per second at 100% capacity
TOXIC_DUMP_POLLUTION_RELEASED    = 100                    -- the maximum amount of fluid to convert into chunk pollution
TOXIC_DUMP_CLOUDS                = 1                      -- the number of toxic clouds to create when gas is released
TOXIC_DUMP_SMOKE_MIN             = 1                      -- the minimum number of trivial smoke clouds created when gas is released
TOXIC_DUMP_SMOKE_MAX             = 3                      -- the maximum number of trivial smoke clouds created when gas is released

TOXIC_DUMP_CLOUD_SMALL           = 'toxic-cloud-small'
TOXIC_DUMP_CLOUD_MEDIUM          = 'toxic-cloud-medium'
TOXIC_DUMP_CLOUD_MEDIUM_PERCENT  = 0.05                   -- As a percentage of "overflow"
TOXIC_DUMP_CLOUD_LARGE           = 'toxic-cloud-large'
TOXIC_DUMP_CLOUD_LARGE_PERCENT   = 0.20                   -- As a percentage of "overflow"
TOXIC_DUMP_CONSUME_PERCENT       = 0.5                    -- Destroys this percentage of the potential output when dumping toxic sludge, divided by toxic sludge ratio for concentrated pollution

POLLUTION_COLLECTOR_NAME         = 'pollutioncollector' 

POLLUTED_AIR_NAME                = "polluted-air"
EMISSIONS_PER_AIR                = 1                      -- amount of actual air pollution per unit of polluted-air
TOXIC_SLUDGE_NAME                = "toxic-sludge"

SLUDGE_PER_BARREL                = settings.startup["zpollution-sludge-per-barrel"].value
MJ_PER_TOXIC_SLUDGE              = settings.startup["zpollution-mj-per-sludge"].value
POLLUTION_DAMAGE_TYPE            = "toxic"

-- when burned, how much of the toxic sludge is completely burned - the rest ends up as pollution
INCENERATOR_EFFICIENCY           = settings.startup["zpollution-incenerator-efficiency"].value

-- speed of the incenerator, in MW
INCINERATOR_OUTPUT          		 = settings.startup["zpollution-incenerator-output"].value

-- amount of polluted-air per unit of toxic sludge
AIR_PER_SLUDGE                   = settings.startup["zpollution-air-per-sludge"].value
SLUDGE_PER_FILTER                = settings.startup["zpollution-sludge-per-filter"].value

--=========--
-- Recipes --
--=========--
FILTER_PER_LIQUIFY               = 1
WATER_PER_FILTER_PERCENT         = 1
BLUE_XENOMASS_PER_RED_XENOMASS           = settings.startup["zpollution-blue-per-red"].value
BLUE_TO_RED_COST                 = settings.startup["zpollution-blue-to-red-cost"].value
POLLUTION_PER_BLUE_XENOMASS          = 500 -- for domesticated nests
SLUDGE_PER_RED_XENOMASS              = 1000 -- for domesticated nests