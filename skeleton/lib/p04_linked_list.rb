require "byebug"
class Node
  attr_reader :key
  attr_accessor :val, :next, :prev

  def initialize(key = nil, val = nil)
    @key = key
    @val = val
    @next = nil
    @prev = nil
  end

  def to_s
    "#{@key}: #{@val}"
  end

  def remove
    # optional but useful, connects previous link to next link
    # and removes self from list.
  end
end

class LinkedList
  include Enumerable

  attr_reader :head, :tail
  def initialize
    @head = Node.new
    @tail = Node.new 
    @head.next = @tail
    @tail.prev = @head
  end

  def [](i)
    each_with_index { |link, j| return link if i == j }
    nil
  end

  def first
    @head.next
  end

  def last
    @tail.prev
  end

  def empty?
      # debugger
      # @head.next.nil? && @head.prev.nil?
        @head.next == @tail && @tail.prev == @head 
      # return false return true if
  end

  def get(key)

  end

  def include?(key)
    current = first 
    until current.next == nil 
      if 
        break 
      end

      current = current.next 
    end 
    return current
 
  end

  def append(key, val)
    # # debugger
    most_recent = @tail.prev 
    new_node = Node.new(key, val)
    new_node.next = @tail 
    new_node.prev = most_recent
    @tail.prev = new_node
    most_recent.next = new_node
  end

  def update(key, val)
    current = first 
    until current.key == key 
      if current.next == nil 
        break 
      end 
      current = current.next 
    end 
    current.val = val
  end

  def remove(key)
  end

  # def initialize
  #   @head = Node.new
  #   @tail = Node.new 
  #   @head.next = @tail
  #   @tail.prev = @head
  # end
  
  def each(&prc)
    current = first
    until current.next == nil
      prc.call(current)
      current = current.next 
    end 
    
  end

  # uncomment when you have `each` working and `Enumerable` included
  def to_s
    inject([]) { |acc, link| acc << "[#{link.key}, #{link.val}]" }.join(", ")
  end
end
