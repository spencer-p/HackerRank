-- mergesort.lua

local merge = {}

-- Count inversions while mergesorting - O(nlogn)
merge.sort = function(array, left, right)
	left = left or 1
	right = right or #array

	local inversions = 0

	-- No merging or inversions if left == right
	if right > left then

		-- Choose midpoint
		local mid = math.floor((left + right)/2)

		-- Sort and add inversions
		inversions = merge.sort(array, left, mid)
		inversions = inversions +  merge.sort(array, mid + 1, right)
		
		-- Merge together and add inversions
		inversions = inversions + merge.merge(array, left, mid, right)

	end

	return inversions
end

-- Merge arrays, return number of inversions
merge.merge = function(array, left, mid, right)

	local inversions = 0

	local leftindex = left
	local rightindex = mid + 1

	local tmp = {}
	local tmpindex = 1

	-- Merge into the tmp array
	while leftindex <= mid and rightindex <= right do
		if array[leftindex] <= array[rightindex] then
			-- Left less than or eq right
			-- Copy and increment
			tmp[tmpindex] = array[leftindex]
			leftindex = leftindex + 1
		else
			-- Right less than left
			-- Copy and increment
			tmp[tmpindex] = array[rightindex]
			rightindex = rightindex + 1

			-- Add to inversion count
			-- A little wacky - distance from the start of the 
			-- right block to the left index
			inversions = inversions + 1--(mid + 1 - leftindex)
		end

		-- Increase tmp index
		tmpindex = tmpindex + 1

	end

	-- These second two while loops could be in the one above,
	-- but it would make inversion counting slightly more complicated.
	-- Catch stragglers on the left
	while leftindex <= mid do
		tmp[tmpindex] = array[leftindex]
		tmpindex = tmpindex + 1
		leftindex = leftindex + 1
	end
	
	-- Catch stragglers on the right
	while rightindex <= mid do
		tmp[tmpindex] = array[rightindex]
		tmpindex = tmpindex + 1
		rightindex = rightindex + 1
	end

	-- Finally, replace the array with what's in tmp
	for i = 1, #tmp do
		array[left + i - 1] = tmp[i]
	end

	-- Return the inversion count
	return inversions

end

return merge
