module Enumerables
  def my_each
    i = 0
    while i < self.size
      yield(self[i])  
      i+=1      
    end
    self
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
  def my_select(&block)
    result = []
    self.each do |elem|
      result << elem if block.call(elem) == true
      end
    end
    result
  end
  def my_all?(&block)
    counter = 0
    self.each do |elem|
      counter += 1 if block.call(elem) == true
      end
    end
    if counter == self.size
      return true
    else
      return false
    end
  end
  def my_any(&block)
    counter = 0
    self.each do |elem|
      counter += 1 if block.call(elem) == true
      end
    end
    if counter.positive?
      return true
    else
      return false
    end
  end
  def my_none?(&block)
    counter = 0
    self.each do |elem|
      counter += 1 if block.call(elem) == false
    end
    if counter == self.size
      return true
    else
      return false
    end
  end
  def my_count(&block)
    counter = 0
    self.each do |elem|
      counter += 1 if block.call(elem) == true
      end
    end
    return counter
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