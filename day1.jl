a, b = eachrow(reduce(hcat, map(l -> parse.(Int, l), split.(readlines("inputs/day1.txt"), "   "))))
part1(a, b) = reduce(-, sort.([a, b])) .|> abs |> sum

function part2(a, b)
  counts = Dict()
  map(i -> counts[i] = get(counts, i, 0) + 1, b)
  sum(i -> i * get(counts, i, 0), a)
end
