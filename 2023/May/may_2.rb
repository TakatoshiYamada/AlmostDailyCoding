# A* Referctoring Code
def heuristic(a, b)
  (a[0] - b[0]).abs + (a[1] - b[1]).abs
end

def get_neighbors(node)
  [
    [node[0] - 1, node[1]],
    [node[0] + 1, node[1]],
    [node[0], node[1] + 1],
    [node[0], node[1] + 1]
  ]
end

def is_valid_neighbor(neighbor, height, width, grid)
  neighbor[0] >= 0 && neighbor[0] < height &&
   neighbor[1] >= 0 && neighbor[1] < width &&
    grid[neighbor[0]][neighbor[1]] == 0
end

def a_star(grid, start, goal)
  height = grid.size
  width = grid[0].size

  g_score = Hash.new(Float::INFINITY)
  g_score[start] = 0

  f_score = Hash.new(Float::INFINITY)
  f_score[start] = heuristic(start, goal)

  open_set = [start]

  came_from = {}

  while !open_set.empty?
    current = open_set.min_by { |node| f_score[node] }

    return reconstruct_path(came_from, current) if current == goal

    open_set.delete(current)

    neighbors = get_neighbors(current)

    neighbors.each do |neighbor|
      next unless is_valid_neighbor(neighbor, height, width, grid)

      tentative_g_score = g_score[current] + 1

      if tentative_g_score < g_score[neighbor]
        came_from[neighbor] = current
        g_score[neighbor] = tentative_g_score
        f_score[neighbor] = g_score[neighbor] + heuristic(neighbor, goal)

        open_set.push(neighbor) unless open_set.include?(neighbor)
      end
    end
  end

  return nil
end

def reconstruct_path(came_from, current)
  path = [current]

  while came_from.has_key?(current)
    current = came_from[current]
    path.unshift(current)
  end

  path
end

grid = [
  [0, 0, 0, 0, 0, 0, 0],
  [0, 1, 1, 1, 1, 0, 0],
  [0, 0, 0, 0, 0, 0, 0],
  [0, 0, 1, 1, 1, 1, 0],
  [0, 0, 0, 0, 0, 0, 0]
]

start = [0, 0]
goal = [4, 6]

path = a_star(grid, start, goal)

if path
  puts "最短経路: #{path.inspect}"
else
  puts "経路が見つかりませんでした"
end
