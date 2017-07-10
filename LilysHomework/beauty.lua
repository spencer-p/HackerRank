-- beauty.lua

local beauty = {}

-- Sums up the differences between each elements
beauty.count = function(array)
	local count = 0
	for i = 1, #array - 1 do
		count = count + math.abs(array[i] - array[i+1])
	end
	return count
end

return beauty
