class MinHeap
    def initialize
        @heap = []
    end

    def push(value)
        @heap.push(value)
        shift_up(@heap.size - 1)
    end

    def pop
        return nil if @heap.empty?

        min = @heap[0]
        last_element = @heap.pop
        unless @heap.empty?
           @heap[0] = last_element
           shift_down(0)
        end
        min
    end

    private

    def shift_up(index)
        # TODO: what is this
        parent_index = (index - 1) / 2

        # TODO: check this
        return if index <= 0 || @heap[parent_index] <= @heap[index]

        @heap[parent_index], @heap[index] = @heap[index], @heap[parent_index]
        shift_up(parent_index)
    end

    def shift_down(index)
        left_child_index = 2 * index + 1
        right_child_index = 2 * index + 2

        return if left_child_index >= @heap.size

        min_child_index =
            if right_child_index >= @heap.size || @heap[left_child_index] < @heap[right_child_index]
                left_child_index
            else
                right_child_index
            end
        return if @heap[index] <= @heap[min_child_index]

        @heap[index], @heap[min_child_index] = @heap[min_child_index], @heap[index]
        shift_down(min_child_index)
    end
end

min_heap = MinHeap.new
min_heap.push(3)
min_heap.push(5)
min_heap.push(1)

min_element = min_heap.pop
puts "Minimum element: #{min_element}"

while (next_element = min_heap.pop)
    puts "Next element: #{next_element}"
end
