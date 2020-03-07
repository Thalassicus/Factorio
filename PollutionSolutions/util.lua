function copyData( _Type, _Name, _args )
	if _args then
		if( type(_args) == 'table' ) then
			local data = data.raw[_Type][_Name]
			for i=1, #_args, 1 do
				data = data[_args[i]]
			end
			return util.table.deepcopy(data)
		else
			return util.table.deepcopy(data.raw[_Type][_Name][_args])
		end
	else
		return util.table.deepcopy(data.raw[_Type][_Name])
	end
end

function makeNewDataFromData(_Type, _OriginalName, _NewName)
	local newDataEntry = copyData(_Type, _OriginalName)
	newDataEntry.name = _NewName
	return newDataEntry
end

function makeNewEntityFromData(_Type, _OriginalName, _NewName, _Order)
	_Order = _Order or "z"
	local newDataEntry = makeNewDataFromData(_Type, _OriginalName, _NewName)
	newDataEntry.order = _Order
	newDataEntry.minable.result = _NewName
	return newDataEntry
end

function makeNewItemFromData(_OriginalName, _NewName, _Order)
	local newDataEntry = makeNewDataFromData("item", _OriginalName, _NewName)
	newDataEntry.place_result = _NewName
	return newDataEntry
end