--=========--
-- Control --
--=========--
TICKS_PER_SECOND				= 60

TOXIC_DUMP_NAME					= 'dump-site'
TOXIC_DUMP_INTERVAL				= 30 * TICKS_PER_SECOND	-- dump pollution every # seconds
TOXIC_DUMP_FILLPERCENT			= 0.0					-- 0.5 When the toxic dump contains more than this percent of it's total capacity, release gas
TOXIC_DUMP_MAX_RELEASED			= 1.0					-- 0.25 The maximum percentage of toxic sludge that can be released in one take
TOXIC_DUMP_SLUDGE_PER_SEC		= 5						-- the amount of toxic sludge to remove per second at 100% capacity
TOXIC_DUMP_POLLUTION_RELEASED	= 100					-- the maximum amount of fluid to convert into chunk pollution
TOXIC_DUMP_CLOUDS				= 1						-- the number of toxic clouds to create when gas is released
TOXIC_DUMP_SMOKE_MIN			= 1						-- the minimum number of trivial smoke clouds created when gas is released
TOXIC_DUMP_SMOKE_MAX			= 3						-- the maximum number of trivial smoke clouds created when gas is released

TOXIC_DUMP_CLOUD_SMALL			= 'toxic-cloud-small'
TOXIC_DUMP_CLOUD_MEDIUM			= 'toxic-cloud-medium'
TOXIC_DUMP_CLOUD_MEDIUM_PERCENT = 0.05					-- As a percentage of "overflow"
TOXIC_DUMP_CLOUD_LARGE			= 'toxic-cloud-large'
TOXIC_DUMP_CLOUD_LARGE_PERCENT	= 0.20					-- As a percentage of "overflow"
TOXIC_DUMP_CONSUME_PERCENT		= 0.5					-- Destroys this percentage of the potential output when dumping toxic sludge, divided by toxic sludge ratio for concentrated pollution

POLLUTION_COLLECTOR_NAME		= 'pollutioncollector' 
POLLUTION_COLLECTOR_INTERVAL	= 60					-- collect pollution every # ticks
POLLUTION_COLLECTION_MIN		= 50					-- minimum amount of pollution required for the collector to operate
POLLUTION_COLLECTION_MAX_PERCENT= 0.1					-- maximum amount of pollution that can be collected, as a percentage of the available

POLLUTED_AIR_NAME				= "polluted-air"
POLLUTED_AIR_RATIO				= 2						-- amount of actual air pollution per unit of polluted-air
TOXIC_SLUDGE_NAME				= "toxicsludge"
TOXIC_SLUDGE_RATIO				= 10					-- amount of polluted-air per unit of toxic sludge

SLUDGE_PER_TOXIC_BARREL			= 250
MJ_PER_TOXIC_SLUDGE				= 0.1
TOXIC_SLUDGE_BURN_PERCENT		= 0.5					-- when burned, how much of the toxic sludge is completely burned - the rest ends up as pollution

POLLUTION_DAMAGE_TYPE			= "toxic"

--=========--
-- Recipes --
--=========--
SLUDGE_PER_FILTER				= 500
WATER_PER_FILTER_PERCENT		= 0.9
XENOMEROS_PER_XENOVASI			= 10
POLLUTION_PER_XENOMEROS			= 500
SLUDGE_PER_XENOVASI				= 1000