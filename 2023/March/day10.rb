class Node
    attr_accessor :value, :left_child, :right_child

    def initialize(value)
        @value = value
        @left_child = nil
        @right_child = nil
    end
end

class BinarySearchTree
    attr_reader :root

    def initialize
        @root = nil
    end

    def insert(value)
        new_node = Node.new(value)

        if @root.nil?
            @root = new_node
            return
        end

        current_node = @root

        while true
            if value < current_node.value
                if current_node.left_child.nil?
                    current_node.left_child = new_node
                    return
                else
                    current_node = current_node.left_child
                end
            elsif value > current_node.value
                if current_node.right_child.nil?
                    current_node.right_child = new_node
                    return
               else
                    current_node = current_node.right_child
                end
            else
                return
            end
        end
    end
end

bst = BinarySearchTree.new

bst.insert(8)
bst.insert(3)
bst.insert(10)
bst.insert(1)
bst.insert(6)
bst.insert(6)
bst.insert(14)
bst.insert(4)
bst.insert(7)
bst.insert(13)

puts bst.root.value
puts bst.root.left_child.right_child.left_child.value
puts bst.root.right_child.right_child.value
