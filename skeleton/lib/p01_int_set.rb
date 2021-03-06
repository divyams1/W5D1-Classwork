require "byebug"
class MaxIntSet
  attr_reader :max , :store
  def initialize(max)
    @max=max
    @store = Array.new(max, false)
  end

  def insert(num)
    raise 'Out of bounds' if num > @max || num < 0
    @store[num] = true
    true
  end

  def remove(num)
    @store[num] = false
  end

  def include?(num)
    @store[num]
  end

  private

  def is_valid?(num)
  end

  def validate!(num)
  end
end


class IntSet
  def initialize(num_buckets = 20)
    @store = Array.new(num_buckets) { Array.new }
  end

  def insert(num)
    index = num % @store.length 
    @store[index] << num                              
  end

  def remove(num)
    index = num % @store.length
    @store[index].delete(num)
  end

  def include?(num)
    index = num % @store.length
    @store[index].include?(num)
  end

  private

  def [](num)
    # optional but useful; return the bucket corresponding to `num`
  end

  def num_buckets
    @store.length
  end
end

class ResizingIntSet
  attr_reader :count

  def initialize(num_buckets = 20)
    @store = Array.new(num_buckets) { Array.new }
    @count = 0
  end

  def insert(num)
    if @count == @store.length
      resize!
    end 
    index = num % @store.length 
    if !@store[index].include?(num) 
    
      @store[index] << num  
      @count += 1
      
    end 
  end

  def remove(num)
    index = num % @store.length
    @count -= 1 if @store[index].include?(num)
    @store[index].delete(num)
    
  end

  def include?(num)
    index = num % @store.length
    @store[index].include?(num)

  end



  private

  def [](num)
    # optional but useful; return the bucket corresponding to `num`
  end

  def num_buckets
    @store.length
  end

  def resize!
      new_arr = Array.new(@store.length * 2) { Array.new }
      @store.flatten.each { |num| new_arr[ num%new_arr.length ] << num }
      @store = new_arr
  end
  
end
