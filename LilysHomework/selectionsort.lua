-- Selection sort

local selection = {}

-- Default comparator
selection.comparator = function(a, b)
	return a > b
end

-- Sorts an array with selection sort, returns # of swaps
selection.sort = function(array, comparator)

	comparator = comparator or selection.comparator

	local swap_count = 0

	for i = 1, #array do
		local min = i
		for j = i + 1, #array do
			if comparator(array[j], array[min]) then
				min = j
			end
		end

		if min ~= i then
			selection.swap(array, i, min)
			swap_count = swap_count + 1
		end
	end

	return swap_count
end

-- Swaps elements i and j of array
selection.swap = function(array, i, j)
	local tmp = array[i]
	array[i] = array[j]
	array[j] = tmp
end

-- Prints an array
selection.print = function(array)
	io.write("{ ")
	for i = 1, #array - 1 do
		io.write(array[i] .. ", ")
	end
	io.write(array[#array] .. " }\n")
end

return selection
