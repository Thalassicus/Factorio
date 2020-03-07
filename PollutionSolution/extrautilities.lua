function printTable(tbl,tablename)
	log(tablename.." = {")
	printTableRecur(tbl,"    ")
	log("}")
end

function printTableRecur(tbl,indent)
	for k,v in pairs(tbl) do
		if type(v) == "table" then
			log(indent..k.." = {")
			printTableRecur(v,indent.."    ")
			log(indent.."}")
		else
			log(indent..k.." = "..tostring(v))
		end
	end
end