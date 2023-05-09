# K-means
require 'matrix'

# Calculate the distance between two points
def euclidean_distance(x, y)
  sum = 0
  x.each_with_index do |value, index|
    sum += (value - y[index]) ** 2
  end
  Math.sqrt(sum)
end

# Find the closest centroid for a given point
def find_closest_centroid(point, centroids)
  min_distance = Float::INFINITY
  closest_centroid = nil
  min_distance = Float::INFINITY

  centroids.each_with_index do |centroid, index|
    distance = euclidean_distance(point, centroid)
    if distance < min_distance
      min_distance = distance
      closest_centroid = index
    end
  end
  closest_centroid
end

# K-means algorithm
def k_means(data, k, max_iterations = 100)
  # Initialize centroids randomly
  centroids = data.sample(k)

  max_iterations.times do
    # Assign data points to the closest centroid
    clusters = Hash.new { |h, k| h[k] = [] }
    data.each do |point|
      closest_centroid = find_closest_centroid(point, centroids)
      clusters[closest_centroid] << point
    end

    # Update centroids by computing the mean of the data points in each cluster
    updated_centroids = []
    clusters.each do |centroid_index, points|
      mean = points.inject(Vector[0, 0]) { |sum, point| sum + Vector[*point] } / points.size.to_f
      updated_centroids[centroid_index] = mean.to_a
    end

    # Stop if centroids don't change anymore
    break if centroids == updated_centroids

    # Update centroids
    centroids = updated_centroids
  end

  centroids
end

# Sample data
data = [
  [1, 2], [1, 4], [1, 0],
  [4, 2], [4, 4], [4, 0]
]

# Run K-means clustering
k = 2
centroids = k_means(data, k)
puts "Centroids: #{centroids}"
