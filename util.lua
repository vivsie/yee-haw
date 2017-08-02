-- shared utilities file for common tasks

--this is so bad please forgive me

local function incr(x, inc)
	if inc == nil then
		return x + 1
	else
		return x + inc
	end
end

local function decr(x, dec)
	if dec == nil then 
		return x - 1
	else
		return x - dec
	end
end

--[[ make assigned controls a thing
local controls = {
	
}
--]]

local m = {
	incr = incr,
	decr = decr
}

return m