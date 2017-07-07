--
-- Find factorizations within a subset
-- or whatever.
--

-- Read data
n = io.read("*number")
setlen = io.read("*number")
set = {}
for i = 1, setlen do
	set[i] = io.read("*number")
end

-- Sort the set
table.sort(set)

-- Print input to be sure
--print("n is", n)
--for i = 1, #set do
--	print("set #", i, "is", set[i])
--end


-- fn to copy a table into a new one
function copyTable(table)
	local new = {}
	for i = 1, #table do
		new[i] = table[i]
	end
	return new
end

-- Do the work
-- Returns the list of stuff and if it was successful
function factorize(n, set, level, result)
	if n == 1 then
		return result, true
	elseif n < 1 then -- went too far
		return nil, false
	else

		-- Define the shortest, what we will return
		local shortest = nil

		-- Find index of first item greater then last in result
		local starti = 1
		if #result ~= 0 then
			while set[starti] < result[#result] do
				starti = starti + 1
			end
		end

		-- We then try factoring out each num in the set (starting at starti)
		for i = starti, #set do
			-- Factor it
			local quotient = n / set[i]

			-- Append the number we factored out to result
			table.insert(result, set[i])

			-- Run the factorization
			local test, success = factorize(quotient, set, level + 1, result)

			-- Save the test if it's better than what we have
			if test and success and (not shortest or #test < #shortest) then
				shortest = copyTable(test)
			end

			-- Pop the number we just used
			table.remove(result)
		end
		
		-- Return the result
		if not shortest then
			return result, false
		else
			return shortest, true
		end

	end
end

-- emit the result
answer, valid = factorize(n, set, 1, {})
if not valid then
	io.write("-1")
else
	local step = 1
	for i = 1, #answer do
		io.write(step .. " ")
		step = step * answer[i]
	end
	io.write(step)
	assert(step == n)
end
io.write("\n")
