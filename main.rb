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
    if counter == size
      return true
    else
      return false
    end
  end

  # my_any enumerable method definition

  def my_any?(&block)
    counter = 0
    my_each do |elem|
      counter += 1 if block.call(elem) == true
    end
    if counter.positive?
      return true
    else
      return false
    end
  end

  # my_none? enumerable method definition

  def my_none?(&block)
    counter = 0
    my_each do |elem|
      counter += 1 if block.call(elem) == false
    end
    if counter == size
      return true
    else
      return false
    end
  end

  # my_count enumerable method definition

  def my_count
    counter = 0
    if block_given?
      my_each do |elem|
        counter += 1 if yield(elem) == true
      end
    else
      counter = size
    end
    counter
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
    if block_given?
      acc ||= first
      my_each do |elem|
        acc = yield(acc, elem)
      end
      acc
    end
  end

  # multiply_els method that uses the "my_inject" method to
  # multiply all the elements in an array

  def multiply_els
    my_inject do |x, y|
      x * y
    end
  end
end

# Method Tests:

# my_each method test:
[1, 2, 3].my_each { |x| puts x }

# my_each_with_index method test:
%w[Hello to everyone].my_each_with_index { |x, y| puts "#{x}'s index is #{y}" }

# my_select method test:
[10, 5, 37].my_select { |x| puts x > 12 }

# my_all? method test:
[1, 2, 3].my_all? { |x| puts x > 4 }

# my_any? method test:
[13, 27, 39].my_any? { |x| puts x < 30 }

# my_none? method test:
[1, 2, 3].my_none? { |x| puts x < 4 }

# my_count method test:
[1, 2, 3].my_count

# my_map method test:
[1, 2, 3].my_map { |x| puts x * 4 }

# my_inject method test:
[1, 2, 3].my_inject { |x, y| puts x + y }

# multiply_els method test:
[1, 2, 3].multiply_els
