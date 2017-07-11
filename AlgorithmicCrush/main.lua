--
-- Crush
-- https://www.hackerrank.com/challenges/crush
--
-- This is essentially a sweep algorithm problem. How many overlaps do we have?
-- The twist is that each range adds a different amount to the total, which we 
-- have to consider. 
--
-- What we're going to do is create an array of pairs (position, change).
-- We'll sort them by position and loop over them, saving the max to print.
-- So when we get the input:
--
-- 1
-- a b k
--
-- The corresponding array would be { { a, k }, { b+1, -k } }
--

-- Read input
-- n (array size) doesn't matter for us
-- m is the number of ranges we'll be given
n, m = io.read("*number", "*number", "*l")

positions = {}

for i = 1, m do
	local a, b, k = io.read("*number", "*number", "*number", "*l")
	table.insert(positions, { position = a, change = k })
	table.insert(positions, { position = b+1, change = -k })
end

table.sort(positions, function(a, b)
	-- For equal positions, ends of ranges MUST come first
	if a.position == b.position then return a.change < b.change end
	return a.position < b.position 
end)

-- Loop through and count the sum, save the max
max, sum = 0, 0
for i, p in ipairs(positions) do
	sum = sum + p.change
	if sum > max then
		max = sum
	end
end

-- Print the result
print(max)
