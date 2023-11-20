# Bellman-Ford algorithm
class Graph
  attr_reader :nodes

  def initialize
    @nodes = {}
  end

  def add_edge(source, target, weight)
    @nodes[source] ||= {}
    @nodes[target] ||= {}
    @nodes[source][target] = weight
  end

  def bellman_ford(source)
    # Step 1: Prepare the distance and predecessor for each node
    distance = {}
    @nodes.keys.each { |node| distance[node] = Float::INFINITY }
    distance[source] = 0

    # Step 2: Relax the edges
    (@nodes.size - 1).times do
      @nodes.each do |node, neighbours|
        neighbours.each do |neighbour, weight|
          new_distance = distance[node] + weight
          distance[neighbour] = new_distance if new_distance < distance[neighbour]
        end
      end
    end

    # Step 3: Check for negative-weight cycles
    @nodes.each do |node, neighbours|
      neighbours.each do |neighbour, weight|
        raise "Negative-weight cycle detected" if distance[node] + weight < distance[neighbour]
      end
    end

    # Return the calculated distances
    distance
  end
end

graph = Graph.new
graph.add_edge('A', 'B', 1)
graph.add_edge('A', 'C', 4)
graph.add_edge('B', 'C', 3)
graph.add_edge('B', 'D', 2)
graph.add_edge('B', 'E', 2)
graph.add_edge('C', 'D', 5)
graph.add_edge('D', 'B', 1)
graph.add_edge('E', 'D', 3)

source_node = 'A'
result = graph.bellman_ford(source_node)
puts "Shortest distances from #{source_node}: #{result}"
