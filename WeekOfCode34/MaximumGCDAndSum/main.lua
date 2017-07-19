--
-- Maximum GCD and Sum
-- https://www.hackerrank.com/contests/w34/challenges/maximum-gcd-and-sum
--

function gcd(a, b)
	if a == 0 and b == 0 then return 0 end

	if a == b then return a end

	if a > b then
		return gcd(a-b, b)
	else
		return gcd(a, b-a)
	end
end

function maxgcd(A, B)
	local greatest_to_least = function(a, b) return a > b end
	table.sort(A, greatest_to_least)
	table.sort(B, greatest_to_least)

	local max = 0
	local maxsum = 0

	for i, a in ipairs(A) do
		if gcd(a, B[1]) < max then
			break
		end
		for j, b in ipairs(B) do
			print(a,b)
			local denominator = gcd(a, b)
			if (denominator > max) or (denominator == max and a + b > maxsum) then
				max = denominator
				maxsum = a + b
			elseif denominator < max then
				break
			end
		end
	end

	return maxsum
end

n = io.read("*number", "*l")
A = {}
A_temp = io.read()
A_i = 1
for token in string.gmatch(A_temp, "[^%s]+") do
	A[A_i] = tonumber(token)
	A_i = A_i + 1
end
B = {}
B_temp = io.read()
B_i = 1
for token in string.gmatch(B_temp, "[^%s]+") do
	B[B_i] = tonumber(token)
	B_i = B_i + 1
end

print(maxgcd(A,B))
