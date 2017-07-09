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
	return selection_inversions(array)

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
