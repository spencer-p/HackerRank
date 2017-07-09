--
-- Insertion Sort Advanced Analysis
--
-- https://www.hackerrank.com/challenges/insertion-sort/problem
--
-- Calculates the amount of operations that insertion sort would have
-- on a given array. This number is the same as the number of
-- inversions in the array.
--

-- Main algorithm
function swaps(array)

	-- Try returning # of inversions
	return merge_inversions(array, 1, #array)

end

-- Counts the number of inversions with a selection sort structure
-- This is actually O( (n^2 - n) / 2 ) = O(n^2), which is not the best
function selection_inversions(array)
	local count = 0

	for i = 1, #array do
		local current = array[i]
		for j = i+1, #array do
			if array[j] < current then
				count = count + 1
			end
		end
	end

	return count
end

-- Count inversions while mergesorting - O(nlogn)
function merge_inversions(array, left, right)
	local inversions = 0
	-- No merging or inversions if left == right
	if right > left then

		-- Choose midpoint
		local mid = math.floor((left + right)/2)

		-- Sort and add inversions
		inversions = merge_inversions(array, left, mid)
		inversions = inversions +  merge_inversions(array, mid + 1, right)

		-- Merge together and add inversions
		inversions = inversions + merge(array, left, mid, right)

	end

	return inversions
end

-- Merge arrays, return number of inversions
function merge(array, left, mid, right)

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
			inversions = inversions + (mid + 1 - leftindex)
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

-- Read data
T = io.read("*number", "*l")
for T_i = 1, T do
	N = io.read("*number")
	array = {}
	for N_i = 1, N do
		array[N_i] = io.read("*number")
	end

	-- Do the analysis and print
	print(swaps(array))
end
