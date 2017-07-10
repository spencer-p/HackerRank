-- 
-- Lily's Homework
--
-- https://www.hackerrank.com/challenges/lilys-homework
--
-- Number of swaps to make in an array to make it "beautiful"
--

minswaps = require "minswaps"

n = io.read("*number", "*l")
a = {}
for i = 1, n do
	a[i] = io.read("*number")
end

print(math.min(minswaps(a), minswaps(a, true)))
