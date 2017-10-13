# johnny_cache = LRUCache.new(4)
#
# johnny_cache.add("I walk the line")
# johnny_cache.add(5)
#
# johnny_cache.count # => returns 2
#
# johnny_cache.add([1,2,3])
# johnny_cache.add(5)
# johnny_cache.add(-5)
# johnny_cache.add({a: 1, b: 2, c: 3})
# johnny_cache.add([1,2,3,4])
# johnny_cache.add("I walk the line")
# johnny_cache.add(:ring_of_fire)
# johnny_cache.add("I walk the line")
# johnny_cache.add({a: 1, b: 2, c: 3})
#
#
# johnny_cache.show # => prints [[1, 2, 3, 4], :ring_of_fire, "I walk the line", {:a=>1, :b=>2, :c=>3}]


class LRUCache
  attr_accessor :size

  def initialize(size)
    @store = Array.new
    @size = size
  end

  def count
    # returns number of elements currently in cache
    @store.count
  end

  def add(el)
    # adds element to cache according to LRU principle
    if @store.include?(el)
      @store.delete(el)
    else
      remove_element if count == size
    end
    @store.push(el)
  end

  def show
    # shows the items in the cache, with the LRU item first
    p @store.dup
  end

  private
  # helper methods go here!
  def remove_element
    @store.shift
  end

end
