class Integer
  # Integer#hash already implemented for you
end

class Array
  def hash
    return self.length % 29 if self == []
    array = [] 
    self.each_with_index { |ele, ind| array << (ele*ind ^ ind)}
    array.inject { |acc, ele| acc ^ ele }
  end
end

class String
  def hash
    return self.length % 29 if self == []
    array = [] 
    self.each_char.with_index do |ele,i| 
      array << (ele.ord * i ^ i )
    end 
    array.inject { |acc, ele| acc ^ ele }
  end
end

class Hash
  # This returns 0 because rspec will break if it returns nil
  # Make sure to implement an actual Hash#hash method
  def hash
     a = self.values.map! { |ele| ele.ord }
     a.sort.hash
  end
end
