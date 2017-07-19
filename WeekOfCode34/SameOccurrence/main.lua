--
-- Same Occurrence
-- https://www.hackerrank.com/contests/w34/challenges/same-occurrence
--

-- Depends on global arr and counts
function get(x, y)
	local sum = 0
	for i = 1, #arr do
		for j = i, #arr do
			local totalx = counts[j][x] - counts[i-1][x]
			local totaly = counts[j][y] - counts[i-1][y]
			if totalx == totaly then sum = sum + 1 end
		end
	end
	return sum
end

n,q = io.read("*number", "*number", "*l")
arr = {}
counts = {}
setmetatable(table, { __index = function() return 0 end })
arr_temp = io.read()
arr_i = 1
for token in string.gmatch(arr_temp, "[^%s]+") do
	arr[arr_i] = tonumber(token)
	if not counts[arr_i] then
		if arr_i == 1 then
			counts[arr_i] = {}
		else
			counts[arr_i] = {table.unpack(counts[arr_i-1])}
		end
	end
	setmetatable(counts[arr_i], { __index = function() return 0 end })
	counts[arr_i][arr[arr_i]] = counts[arr_i][arr[arr_i]] + 1
	arr_i = arr_i + 1
end
counts[arr_i] = counts[arr_i-1]
counts[0] = {}
setmetatable(counts[0], { __index = function() return 0 end })
a0 = 0
while a0 < q do
	x,y = io.read("*number", "*number", "*l")
	print(get(x, y))
	a0 = a0 + 1
end

