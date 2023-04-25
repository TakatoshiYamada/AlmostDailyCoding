require 'set'

class Graph
  def initialize
    # @vertices is a set of vertices
    # q: このコードはどういう意味？
    # a: Set.new は空の集合を作る
    @vertices = Set.new
    # @edges is a hash of vertices to sets of vertices
    # q: このコードはどういう意味？
    # a: Hash.new は空のハッシュを作る
    @edges = Hash.new
  end

  def add_edge(node1, node2)
    # q: このコードはどういう意味？
    # a: @vertices に node1 と node2 を追加する
    @vertices.add(node1)
    @vertices.add(node2)
    # q: このコードはどういう意味？
    # a: @edges に node1 と node2 を追加する
    @edges[node1] = Set.new unless @edges.has_key?(node1)
  end

  def dfs(start_node, visited = Set.new, &block)
    return if visited.include?(start_node)

    visited.add(start_node)

    block.call(start_node) if block_given?

    if @edges[start_node]
      @edges[start_node].each do |node|
        unless visited.include?(node)
          dfs(node, visited, &block)
        end
      end
    end

    visited
  end
end

graph = Graph.new
graph.add_edge('A', 'B')
graph.add_edge('A', 'C')
graph.add_edge('B', 'D')
graph.add_edge('C', 'D')

graph.dfs('A') { |node| puts node }
graph.dfs('B') { |node| puts node }
graph.dfs('C') { |node| puts node }
