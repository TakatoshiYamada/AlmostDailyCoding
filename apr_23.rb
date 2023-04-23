require 'set'

# DFS
class Graph
  def initialize
    @adjacency_list = {}
  end

  def add_edge(node1, node2)
    @adjacency_list[node1] ||= []
    @adjacency_list[node2] ||= []
    @adjacency_list[node1] << node2
    @adjacency_list[node2] << node1
  end

  def dfs(start_node, visited = Set.new)
    # nodeが既に訪問済みか確認
    return if visited.include?(start_node)

    # 現在のノードを訪問済みとしてマーク
    visited.add(start_node)

    # 現在のノードを表示
    puts start_node

    # 隣接ノードを探索
    @adjacency_list[start_node].each do |neighbor|
      dfs(neighbor, visited)
    end
  end
end

graph = Graph.new
graph.add_edge('A', 'B')
graph.add_edge('A', 'C')
graph.add_edge('B', 'D')
graph.add_edge('C', 'D')

# 深さ優先探索の実行
graph.dfs('A')
