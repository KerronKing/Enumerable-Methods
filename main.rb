# frozen_string_literal: true

module Enumerable
  # my_each enumerable method definition

  def my_each
    i = 0
    while i < size
      yield(self[i])
      i += 1
    end
    self
  end

  # my_each_with_index enumerable method definition

  def my_each_with_index
    i = 0
    while i < size
      yield(self[i], i)
      i += 1
    end
    self
  end

  # my_select enumerable method definition

  def my_select(&block)
    result = []
    my_each do |elem|
      result << elem if block.call(elem) == true
    end
    result
  end

  # my_all? enumerable method definition

  def my_all?(&block)
    counter = 0
    my_each do |elem|
      counter += 1 if block.call(elem) == true
    end
    return true if counter == size

    false
  end

  # my_any enumerable method definition

  def my_any?(&block)
    counter = 0
    my_each do |elem|
      counter += 1 if block.call(elem) == true
    end
    return true if counter.positive?

    false
  end

  # my_none? enumerable method definition

  def my_none?(&block)
    counter = 0
    my_each do |elem|
      counter += 1 if block.call(elem) == false
    end
    return true if counter == size

    false
  end

  # my_count enumerable method definition

  def my_count(arg = nil)
    result = []
    if block_given?
      my_each do |elem|
        result << elem if yield(elem) == true
      end
    end
    
    if !block_given?
      if arg != nil
        my_each do |elem|
          result << elem if elem == arg
        end
      end
      if arg == nil
        result = self
      end
    end
    result.size
  end

  # my_map enumerable method definition

  def my_map(&block)
    result = []
    my_each do |elem|
      result << block.call(elem)
    end
    result
  end

  # my_inject enumerable method definition

  def my_inject
    acc = first
    drop(1).my_each do |elem|
      acc = yield(acc, elem)
    end
    acc
  end

  # multiply_els method that uses the "my_inject" method to
  # multiply all of the elements in an array

  def multiply_els
    my_inject do |x, y|
      x * y
    end
  end
end

arr = [1, 2, 4, 2]

puts arr.my_count { |x| x % 2 == 0 }