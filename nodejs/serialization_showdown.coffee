# Configuration / loading
[serializer, method, iterations] = process.argv[2..]
iterations = parseInt iterations
benchmark = require "./benchmarks/#{serializer.toLowerCase()}_benchmark.coffee"
data = require "../test_data.json"
data = benchmark.serialize data if method == "deserialize"

# Run the benchmark
start = new Date().getTime()
benchmark[method](data) for i in [0..iterations]
end   = new Date().getTime()

# Output the results
console.log (end - start)/1000
