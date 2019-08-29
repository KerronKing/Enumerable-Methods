module Enumerable
  def my_each
    i = 0
    while i < self.size
      yield(self[i])  
      i += 1      
    end
    self
  end
  def my_each_with_index
    i = 0
    while i < self.size
      yield(self[i], i)  
      i += 1      
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
  def my_inject
    if block_given?
      acc ||= self.first
      self.my_each do |elem|
        acc = yield(acc, elem)
      end
    acc
    end
  end
  def multiply_els
    self.my_inject do |x, y|
      x * y
    end
  end
end


["Hello", "to", "everyone"].my_each_with_index { |x, y| puts "#{x}'s index is #{y}"}