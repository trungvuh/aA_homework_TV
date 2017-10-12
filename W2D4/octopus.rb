# Big O-ctopus and Biggest Fish
#
# A Very Hungry Octopus wants to eat the longest fish in an array of fish.
#
# ['fish', 'fiiish', 'fiiiiish', 'fiiiish', 'fffish', 'ffiiiiisshh', 'fsh', 'fiiiissshhhhhh']
# => "fiiiissshhhhhh"
# Sluggish Octopus
#
# Find the longest fish in O(n^2) time. Do this by comparing all fish lengths to all other fish lengths
#
# Dominant Octopus
#
# Find the longest fish in O(n log n) time. Hint: You saw a sorting algorithm that runs in O(n log n) in the Sorting Demo. Remember that Big O is classified by the dominant term.
#
# Clever Octopus
#
# Find the longest fish in O(n) time. The octopus can hold on to the longest fish that you have found so far while stepping through the array only once.
#
# Dancing Octopus
#
# Full of fish, the Octopus attempts Dance Dance Revolution. The game has tiles in the following directions:
#
# tiles_array = ["up", "right-up", "right", "right-down", "down", "left-down", "left",  "left-up" ]
# To play the game, the octopus must step on a tile with her corresponding tentacle. We can assume that the octopus's eight tentacles are numbered and correspond to the tile direction indices.
#
# Slow Dance
#
# Given a tile direction, iterate through a tiles array to return the tentacle number (tile index) the octopus must move. This should take O(n) time.
#
# slow_dance("up", tiles_array)
# > 0
#
# slow_dance("right-down", tiles_array)
# > 3
# Constant Dance!
#
# Now that the octopus is warmed up, let's help her dance faster. Use a different data structure and write a new function so that you can access the tentacle number in O(1) time.
#
# fast_dance("up", new_tiles_data_structure)
# > 0
#
# fast_dance("right-down", new_tiles_data_structure)
# > 3
# When you're finished, check out the solutions!'

def sluggish(array)
  longest = 0
  (0...array.length - 1).each do |i|
    (i+1...array.length).each do |j|
      longest = self[j] if self[j].length > self[i].length
    end
  end
  longest
end

def dominant(array)
  quick_sort(array).last
end

def quick_sort(array)
  return array if array.length <= 1
  pivot = array.first
  left = array.select { |e| e.length < pivot.length }
  right = array.select { |e| e.length >= pivot.length }
  quick_sort(left) + [pivot] + quick_sort.right
end

def clever(array)
  longest = array.first
  array.each do |word|
    longest = word if word.length > longest.length
  end

end

def slow_dance(str, tiles_array)
  tiles_array = ["up", "right-up", "right", "right-down", "down", "left-down", "left",  "left-up" ]

  tiles_array.each_with_index do |word, idx|
    return idx if str == word
  end
end

tiles_hash = {
  "up" => 0,
  "right-up" => 1,
  "right" => 2,
  "right-down" => 3,
  "down" => 4,
  "left-down" => 5,
  "left" => 6,
  "left-up" => 7
}

def fast_dance(str, tiles_hash)
  tiles_hash[str]
end
