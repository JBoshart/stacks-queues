class Stack #working
  attr_reader :store
  #LIFO
  def initialize
    @store = Array.new
  end

  def fire
    @store.shift
  end

  def hire(element)
    @store.unshift(element)
  end

  def size
    @store.length
  end

  def empty?
    size == 0
  end
end
