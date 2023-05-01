#bellman_ford
def bellman_ford(graph, source)
  # Step 1: Prepare the distance and predecessor for each node
  distance = {}
  graph.keys.each { |node| distance[node] = Float::INFINITY }
  distance[source] = 0

  # Step 2: Relax the edges
  (graph.size - 1).times do
    graph.each do |node, neighbours|
      neighbours.each do |neighbour, weight|
        new_distance = distance[node] + weight
        if new_distance < distance[neighbour]
          distance[neighbour] = new_distance
        end
      end
    end
  end

  # Step 3: Check for negative-weight cycles
  graph.each do |node, neighbours|
    neighbours.each do |neighbour, weight|
      raise "Negative-weight cycle detected" if distance[node] + weight < distance[neighbour]
    end
  end

  # Return the calculated distances
  distance
end

graph = {
  'A' => { 'B' => 1, 'C' => 4 },
  'B' => { 'C' => 3, 'D' => 2, 'E' => 2 },
  'C' => {},
  'D' => { 'B' => 1, 'C' => 5 },
  'E' => { 'D' => 3 }
}

source_node = 'A'
result = bellman_ford(graph, source_node)
puts "Shortest distances from #{source_node}: #{result}"
