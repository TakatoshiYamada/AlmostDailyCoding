# グラフ理論実装
# 隣接リストを用いたグラフの実装
# 無向グラフを想定
class Graph
  # 初期化
  def initialize
    # 隣接リストを表すハッシュ
    @adjaceancy_list = {}
  end

  # ノードを追加する
  def add_node(node)
    # ノードが存在しない場合はノードを追加
    # key?メソッドはハッシュに指定したキーが存在するかを調べる
    @adjaceancy_list[node] = [] unless @adjaceancy_list.key?(node)
  end

  def add_edge(node1, node2)
    add_node(node1)
    add_node(node2)

    # ノード同士を結ぶ
    # 隣接リストはハッシュなので、ノードをキーとして値を取得できる
    @adjaceancy_list[node1] << node2
    @adjaceancy_list[node2] << node1
  end
end

graph = Graph.new

graph.add_node('A')
graph.add_node('B')
graph.add_node('C')
graph.add_node('D')

graph.add_edge('A', 'B')
graph.add_edge('A', 'C')
graph.add_edge('B', 'D')
graph.add_edge('C', 'D')

# graphの中身を確認
# inspectメソッドはオブジェクトの中身を文字列で返す
puts graph.inspect
