class Graph
  # 初期化
  def initialize
    # q: このコードは何をしているのか？
    # a: インスタンス変数 @graph に、キーが存在しない場合に空のハッシュを返すように設定している
    @graph = Hash.new{ |h, k| h[k] = {} }
  end

  # 辺を追加
  def add_edge(node1, node2, weight)
    # q: このコードは何をしているのか？
    # a: インスタンス変数 @graph に、キーが node1 であるハッシュのキー node2 に weight を設定している 
    @graph[node1][node2] = weight
    @graph[node2][node1] = weight
  end

  # ダイクストラ法で最短経路を求める
  def dijkstra(source)
    # q: このコードは何をしているのか？
    # a: インスタンス変数 @graph のキーを全て取得し、
    # それぞれに対して、Float::INFINITY を設定している
    # 最初に無限大を設定しておくことで、後で最短経路を求める際に、
    # 無限大より小さい値があれば、その値を最短経路として設定することができる
    distance = Hash.new(Float::INFINITY)
    # q: このコードは何をしているのか？
    # a: 訪問済みのノードを管理するためのハッシュを初期化している
    visited = {}

    # q: このコードは何をしているのか？
    # distance[source] = 0 は、ソースノードの距離を0に設定している
    distance[source] = 0

    # q: このコードは何をしているのか？
    # a: 訪問済みのノードが全て true になるまで、以下の処理を繰り返す
    # 1. まだ訪問していないノードの中で最小の距離を持つノードを選択
    # 2. 選択したノードを訪問済みにする
    # 3. 選択したノードに隣接するノードの距離を更新する
    # 4. ノードを訪問済みとしてマーク
    # 5. 1に戻る
    # この処理を繰り返すことで、全てのノードの距離を求めることができる
    # この処理は、ノードの数が多くなると、計算量が多くなるため、
    # 計算量を減らすために、ヒープを使うことができる
    # ヒープを使うことで、最小の距離を持つノードを選択する処理を高速化することができる
    # また、ヒープを使うことで、訪問済みのノードを管理するためのハッシュを使わなくても良くなる
    # ヒープを使うことで、計算量を O(n^2) から O(n log n) に減らすことができる
    # ただし、ヒープを使うことで、実装が少し複雑になる
    # このコードでは、ヒープを使わずに、計算量を O(n^2) で実装している
    until visited.size == @graph.size
      # q: このコードは何をしているのか？
      # a: 訪問済みでないノードの中で、最小の距離を持つノードを選択している
      min_distance_node = nil

      # q: このコードは何をしているのか？
      # a: 訪問済みでないノードの中で、最小の距離を持つノードを選択している
      @graph.each_key do |node|
        # q: このコードは何をしているのか？
        # a: 訪問済みでないノードの中で、最小の距離を持つノードを選択している
        # ただし、最初は、min_distance_node が nil なので、min_distance_node に node を設定している
        # 2回目以降は、min_distance_node が nil でない場合に、distance[node] < distance[min_distance_node] が true であれば、min_distance_node に node を設定している
        # つまり、min_distance_node には、訪問済みでないノードの中で、最小の距離を持つノードが設定される
        if !visited[node] && (min_distance_node.nil? || distance[node] < distance[min_distance_node])
          min_distance_node = node
        end
      end

      # q: このコードは何をしているのか？
      # a: 訪問済みでないノードがない場合は、ループを抜ける
      # つまり、全てのノードを訪問済みにした場合は、ループを抜ける
      # この処理がないと、無限ループになる
      # なぜなら、訪問済みでないノードがない場合は、min_distance_node が
			# nil になるため、ループが終了しなくなる
      break unless min_distance_node

      # q: このコードは何をしているのか？
      # a: 訪問済みでないノードの中で、最小の距離を持つノードを選択している
      # つまり、min_distance_node には、訪問済みでないノードの中で、
			# 最小の距離を持つノードが設定される
      @graph[min_distance_node].each do |neighbor, weight|
        new_distance = distance[min_distance_node] + weight
        distance[neighbor] = new_distance if new_distance < distance[neighbor]
      end

      # q: このコードは何をしているのか？
      # visited[min_distance_node] = true は、
			# min_distance_node を訪問済みにしている
      visited[min_distance_node] = true
    end

    # q: このコードは何をしているのか？
    # a: distance を返している
    # distanceは、ソースノードから各ノードまでの最短距離が設定されている
    distance
  end
end

graph = Graph.new
graph.add_edge('A', 'B', 3)
graph.add_edge('A', 'C', 1)
graph.add_edge('B', 'C', 7)
graph.add_edge('B', 'D', 5)
graph.add_edge('C', 'B', 2)
graph.add_edge('C', 'D', 12)

source_node = 'A'
result = graph.dijkstra(source_node)
puts "Shortest distances from #{source_node}: #{result}"
