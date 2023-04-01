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

  def top
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

  def front
    @queue.first
  end

  def empty?
    @queue.empty?
  end
end
