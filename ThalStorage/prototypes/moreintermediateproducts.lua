--table.insert(data.raw["module"]["productivity-module"].limitation,"productivity-module")
--table.insert(data.raw["module"]["productivity-module-2"].limitation,"productivity-module")
--table.insert(data.raw["module"]["productivity-module-3"].limitation,"productivity-module")

local newProducts = {
	"productivity-module",
	"productivity-module-2",
	--"productivity-module-3",
	"speed-module",
	"speed-module-2",
	--"speed-module-3",
	"effectivity-module",
	"effectivity-module-2",
	--"effectivity-module-3",
}

for k,v in pairs(newProducts) do
	table.insert(data.raw["module"]["productivity-module"].limitation,v)
	table.insert(data.raw["module"]["productivity-module-2"].limitation,v)
	table.insert(data.raw["module"]["productivity-module-3"].limitation,v)
end