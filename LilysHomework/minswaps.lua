--
-- This function counts the minimum number of swaps that Selection Sort would
-- need in order to sort the given array, in a time constraint much lower than
-- Selection Sort would.
--
-- The sort also doesn't happen in place, so array can be used again to check
-- in reverse or whatever.
--

return function(array, reverse)
	reverse = reverse or false

	-- Create the comparator fn, if in reverse or not
	local comparator = function(a, b)
		if reverse then
			return a.value > b.value
		else
			return a.value < b.value
		end
	end

	-- Create a table of arrays paired with their indexes
	-- The visited element will be used as expected
	local positions = {}
	for i = 1, #array do
		positions[i] = {
			value = array[i],
			index = i,
			visited = false
		}
	end

	-- Sort our new list, with the comparator from above
	table.sort(positions, comparator)

	local swaps = 0

	for i, p in ipairs(positions) do

		-- Skip the work if already swapped,
		-- or if the index didn't change after sorting
		if not (p.visited or p.index == i) then
			
			-- Now we follow the positions.index chain until we find something
			-- we haven't visited. The amounts of cycles this takes is the num
			-- of swaps (minus one).
			local cycle_size = 0
			local j = i
			while not positions[j].visited do
				positions[j].visited = true
				j = positions[j].index;
				cycle_size = cycle_size + 1
			end

			swaps = swaps + cycle_size - 1
		end

	end

	return swaps

end
