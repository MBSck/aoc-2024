vectors = reduce(hcat, map(l -> parse.(Int, l), split.(readlines("puzzle_id.txt"), "   ")))

part1 = reduce(-, sort!.(eachrow(vectors))) .|> abs |> sum

function lookup(vectors)
  counts = Dict()
  map(i -> counts[i] = get(counts, i, 0) + 1, vectors[end, :])
  map(i -> i * get(counts, i, 0), vectors[begin, :]) |> sum
end

function double_dict(vectors)
  counts_left, counts_right = Dict(), Dict()
  map(i -> counts_left[i] = get(counts_left, i, 0) + 1, vectors[begin, :])
  map(i -> counts_right[i] = get(counts_right, i, 0) + 1, vectors[end, :])
  [k * v * get(counts_right, k, 0) for (k, v) in counts_left] |> sum
end
