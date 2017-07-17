--
-- Once in a Tram
-- https://www.hackerrank.com/contests/w34/challenges/once-in-a-tram
--

function strsum(str, a, b)
	if type(str) == "number" then
		str = tostring(str)
	end
	local sum = 0
	for i = a, b do
		sum = sum + tonumber(str:sub(i,i))
	end
	return sum
end

function islucky(str)
	if type(str) == "number" then
		str = tostring(str)
	end
	return strsum(str, 1, 3) == strsum(str, 4, 6)
end

function getnextlucky(n)
	repeat
		n = n + 1
	until islucky(n)
	return n
end
