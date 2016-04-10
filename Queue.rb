class Queue #waiting
  attr_reader :store
  #FIFO
  def initialize
    @store = Array.new
  end

  def dequeue
    @store.shift
  end

  def enqueue(element)
    @store << element
  end

  def size
    @store.length
  end

  def empty?
    size == 0
  end
end
