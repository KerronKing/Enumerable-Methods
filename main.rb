module Enumerable
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
    self.my_each do |elem|
      result << elem if block.call(elem) == true
    end
    result
  end
  def my_all?(&block)
    counter = 0
    self.my_each do |elem|
      counter += 1 if block.call(elem) == true
    end
    if counter == self.size
      return true
    else
      return false
    end
  end
  def my_any(&block)
    counter = 0
    self.my_each do |elem|
      counter += 1 if block.call(elem) == true
    end
    if counter.positive?
      return true
    else
      return false
    end
  end
  def my_none?(&block)
    counter = 0
    self.my_each do |elem|
      counter += 1 if block.call(elem) == false
    end
    if counter == self.size
      return true
    else
      return false
    end
  end
  def my_count
    counter = 0
    if block_given?
      self.my_each do |elem|
        counter += 1 if yield(elem) == true
      end
    else
      counter = self.size
    end
    counter
  end
  def my_map(&block)
    result = []
    self.my_each do |elem|
      result << block.call(elem)
    end
    result
  end
  def my_inject(acc, &block)
    self.my_each do |elem|
      acc = block.call(acc, elem)
    end
    acc
  end
  def multiple_els(&block)
    self.my_inject {block.call(elem)}
  end
end


puts [1, 2, 3].my_count 