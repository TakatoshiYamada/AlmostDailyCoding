# BFS

# グラフの隣接リスト表現
graph = {
  'A' => ['B', 'C'],
  'B' => ['A', 'D', 'E'],
  'C' => ['A', 'F'],
  'D' => ['B'],
  'E' => ['B', 'F'],
  'F' => ['C', 'E']
}

# 幅優先探索
def bfs (graph, start)
  visited = []  # 訪問済みのノードを記録する配列
  queue = [start]    # 次に訪問するノードを記録する配列

  while queue.any? # キューが空になるまで繰り返す
    current_node = queue.shift # キューから先頭の要素を取り出す
    visited << current_node # 訪問済みのノードに追加する

    # 現在のノードに隣接するノードを取り出す
    graph[current_node].each do |neighbor|
      # 隣接ノードが訪問済みでなければキューに追加する
        unless visited.include?(neighbor) || queue.include?(neighbor)
          queue << neighbor
        end
    end
  end

  visited # 訪問済みのノードを返す
end

# グラフの探索を実行する
start_node = 'A'
result = bfs(graph, start_node)
puts "BFS resutl starting from #{start_node}: #{result.join(' -> ')}"
