# ヒューリスティック関数(マンハッタン距離)
def huristic(a, b)
  (a[0] - b[0]).abs + (a[1] - b[1]).abs
end

# A*アルゴリズムの実装
def a_star(grid, start, goal)
  # グリッドのサイズ
  height = grid.size
  width = grid[0].size

  # 各ノードの開始地点からのコスト
  g_score = Hash.new(Float::INFINITY)
  g_score[start] = 0

  # 各ノードの開始地点からのコスト + ヒューリスティック関数の値
  f_score = Hash.new(Float::INFINITY)
  g_score[start] = huristic(start, goal)

  # 処理対象のノード
  open_set = [start]

  # 各ノードの親ノード
  came_from = {}

  # q: このコードは何をしているのか？
  while !open_set.empty?
    #f_scooreが最小のノードを現在のノードとして選択
    current = open_set.min_by { |node| f_score[node] }

    # ゴールに到達した場合、経路を再構築して返す
    if current == goal
      path = [current]
      while came_from.has_key?(current)
        current = came_from[current]
        path.unshift(current)
      end
      return path
    end

    open_set.delete(current)

    # 隣接するノードを探索
    neighbors = [
      [current[0] - 1, current[1]],
      [current[0] + 1, current[1]],
      [current[0], current[1] - 1],
      [current[0], current[1] + 1]
    ]

    neighbors.each do |neighbor|
      # グリッドの範囲外または壁の場合はスキップ
      if neighbor[0] < 0 || neighbor[0] >= height || neighbor[1] < 0 || neighbor[1] >= width || grid[neighbor[0]][neighbor[1]] == 1
        next
      end

      # 隣接ノードまでのコストを計算
      tantative_g_score = g_score[current] + 1

      # より良い経路が見つかった場合、コストを更新
      if tantative_g_score < g_score[neighbor]
        came_from[neighbor] = current
        g_score[neighbor] = tantative_g_score
        f_score[neighbor] = g_score[neighbor] + huristic(neighbor, goal)

        open_set.push(neighbor) unless open_set.include?(neighbor)
      end
    end
  end

  # ゴールに到達できなかった場合はnilを返す
  return nil
end

# 二次元グリッドの例 (0: 移動可能, 1: 障害物)
grid = [
  [0, 0, 0, 0, 0, 0, 0],
  [0, 1, 1, 1, 1, 0, 0],
  [0, 0, 0, 0, 0, 0, 0],
  [0, 0, 1, 1, 1, 1, 0],
  [0, 0, 0, 0, 0, 0, 0]
  ]

  # 開始地点とゴール地点
  start = [0, 0]
  goal = [4, 6]

  # A*アルゴリズムで最短経路を探索
  path = a_star(grid, start, goal)

  # 結果を出力
  if path
    puts "最短経路: #{path.inspect}"
  else
    puts "経路が見つかりませんでした"
  end
