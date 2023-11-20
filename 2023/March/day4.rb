class Stack
  def initialize
    @stack = []
  end

  def push(element)
    @stack.push(element)
  end

  def pop
    @stack.pop
  end

  def peek
    @stack.last
  end

  def empty?
    @stack.empty?
  end
end

class Queue
  def initialize
    @queue = []
  end

  def enqueue(element)
    @queue.push(element)
  end

  def dequeue
    @queue.shift
  end

  def peek
    @queue.first
  end

  def empty?
    @queue.empty?
  end
end

stack = Stack.new
stack.push(1)
stack.push(2)
stack.push(3)

p 'Stack'
puts stack.pop
puts stack.peek
puts stack.empty?

stack.pop
stack.pop

puts stack.empty?

queue = Queue.new
queue.enqueue("A")
queue.enqueue("B")
queue.enqueue("C")

p 'Queue'
puts queue.dequeue
puts queue.peek
puts queue.empty?

queue.dequeue
queue.dequeue

puts queue.empty?
