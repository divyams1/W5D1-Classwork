class HashSet
  attr_reader :count

  def initialize(num_buckets = 8)
    @store = Array.new(num_buckets) { Array.new }
    @count = 0
  end

  def insert(key)
    if @count == @store.length
      resize!
    end 
    index = key.hash % @store.length
    if !@store[index].include?(key) 
    
      @store[index] << key  
      @count += 1
      
    end 
  end

  def include?(key)
    index = key.hash % @store.length
    @store[index].include?(key)
  end

  def remove(key)
    index = key.hash % @store.length
    @count -= 1 if @store[index].include?(key)
    @store[index].delete(key)
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
    @store.flatten.each { |num| new_arr[ num % new_arr.length ] << num }
    @store = new_arr
  end
end
