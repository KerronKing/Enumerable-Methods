module Enumerables
  def my_each
    i = 0
    while i < self.size
      yield(self[i])  
      i+=1      
    end
    self
  end
end
  end
  def my_each_with_index
    i = index
    self[index] = item
    while i < self.size
      yield(self[i])  
      i+=1      
    end
    self
  end
  end
  def my_select(&block)
    result = []
    self.each do |elem|
      result << block.call(elem) if block.call(elem) == true
    end
    result
  end
  def my_all?
    counter = 0
    self.each do |elem|
      counter += 1 if block.call(elem) == true
    end
    if counter == self.size
      return true
    else
      return false
    end
  end
  def my_any

  end
  def my_none?

  end
  def my_count

  end
  def my_map(&block)
    result = []
    self.each do |elem|
      result << block.call(elem)
    end
    result
  end
  def my_inject

  end
  def multiple_els

  end
end