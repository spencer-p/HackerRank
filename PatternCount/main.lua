--
-- Pattern count
-- https://www.hackerrank.com/contests/w33/challenges/pattern-count
--

function count(str)
	local count = 0

	-- matching will tell us if we are currently set up for a match
	local matching = false

	for i = 1, #str do
		if str:sub(i, i) == "1" then
			-- If this is the end, increment
			if matching then
				count = count + 1
			end

			-- Check if this starts another or not
			if str:sub(i+1, i+1) == "0" then
				matching = true
			else
				matching = false
			end
		elseif str:sub(i, i) ~= "0" and matching then
			matching = false
		end
	end

	return count
end

n = io.read("*n", "*l")
for i = 1, n do
	str = io.read("*l")
	print(count(str))
end
