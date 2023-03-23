class Node
  attr_accessor :value, :left_child, :right_child

  def initialize(value)
    @value = value
    @left_child = nil
    @right_child = nil
  end
end

class BinaryTree
  attr_accessor :root

  def initialize
    @root = nil
  end

  def add_node(value)
    new_node = Node.new(value)

    if @root.nil?
      @root = new_node
    else
      current_node = @root
      loop do
        if value < current_node.value
          if current_node.left_child.nil?
            current_node.left_child = new_node
            break
          else
            current_node = current_node.left_child
          end
        elsif value > current_node.value
          if current_node.right_child.nil?
            current_node.right_child = new_node
            break
          else
            current_node = current_node.right_child
          end
        else
          break
        end
      end
    end
  end

  def find_node(value)
    current_node = @root

    loop do
      return nil if current_node.nil?
      return current_node if current_node.value == value

      if value < current_node.value
        current_node = current_node.left_child
      else
        current_node = current_node.right_child
      end
    end
  end
end


tree = BinaryTree.new
tree.add_node(5)
tree.add_node(3)
tree.add_node(8)
tree.add_node(1)
tree.add_node(4)
tree.add_node(7)
tree.add_node(10)

node = tree.find_node(4)
puts node.value # 4
