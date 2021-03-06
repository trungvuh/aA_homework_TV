# Exercise 3 - Map
#
# As you saw in the videos for tonight, a map can be implemented using a 2D array. Let's write a Map class (following a similar pattern to Stack and Queue) that implements a map using only arrays.
#
# Remember, a map stores information in key-value pairs, where the keys are always unique. When implemented with arrays, a map might look something like this: my_map = [[k1, v1], [k2, v2], [k3, v2], ...].
#
# Our Map class should have the following instance methods: assign(key, value), lookup(key), remove(key), show. Note that the assign method can be used to either create a new key-value pair or update the value for a pre-existing key. It's up to you to check whether a key currently exists!
#
# As always, test your code thoroughly to make sure all properties of maps are enforced.
#
class Map

  def initialize
    @map = []
  end

  def assign(key, value)
    idx = @map.index { |pair| pair[0] == key }
    idx ? @map[idx][1] = value : @map.push([key, value])
    [key, value]
  end

  def lookup(key)
    @map.each { |pair| return pair[1] if pair[0] == key }
  end

  def remove(key)
    @map.reject! { |pair| pair[0] == key }
  end

  def show
    @map.dup
  end

end
