# K-means
require 'matrix'

def euclidean_distance(x, y)
  (x - y).magnitude
end

def find_closest_centroid(point, centroids)
  centroids.map { |centroid| euclidean_distance(point, centroid) }.each_with_index.min[1]
end

def k_means(data, k, max_iterations = 100)
  data.map! { |point| Vector[*point] }
  centroids = data.sample(k)

  max_iterations.times do
    clusters = Array.new(k) { [] }

    data.each do |point|
      clusters[find_closest_centroid(point, centroids)] << point
    end

    clusters.each_with_index do |points, index|
      next if points.empty?

      centroids[index] = points.inject(:+) / points.size
    end
  end

  centroids.map(&:to_a)
end

data = [[1, 2], [1, 4], [1, 0], [4, 2], [4, 4], [4, 0]]
k = 2
centroids = k_means(data, k)
puts "Centroids: #{centroids}"
