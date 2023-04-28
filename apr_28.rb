# RubyでのDijkstraアルゴリズムの実装
def dijkstra(graph, source)
  # step1: 距離と訪問済のハッシュを初期化
  distance = {}
  visited = {}

  # 距離と訪問済みのシュを初期化
  graph.each_key do |node|
    distance[node] = Float::INFINITY
    visited[node] = false
  end

  # ソースノードの距離を0に設定
  distance[source] = 0

  # step2: まだ訪問していないノードの中で最小の距離を持つノードを選択
  until visited.values.all?
    min_distance_node = nil

    graph.each_key do |node|
      if !visited[node] && (min_distance_node.nil? || distance[node] < distance[min_distance_node])
        min_distance_node = node
      end
    end

    break unless min_distance_node

    # step3: 選択したノードを訪問済みにする
    graph[min_distance_node].each do |neighbor, weight|
      new_distance = distance[min_distance_node] + weight
      distance[neighbor] = new_distance if new_distance < distance[neighbor]
    end

    # step4: ノードを訪問済みとしてマーク
    visited[min_distance_node] = true
  end

  distance
end


graph = {
  'A' => { 'B' => 3, 'C' => 1 },
  'B' => { 'C' => 7, 'D' => 5 },
  'C' => { 'B' => 2, 'D' => 12 },
  'D' => {}
}

source_node = 'A'
result = dijkstra(graph, source_node)
puts "Shortest distances from #{source_node}: #{result}"
