def sluggish_fishfinder(fish_arr)
  longest_fish = ""
  fish_arr.length.times do |i|
    (0...fish_arr.length).each do |j|
      longest_fish = fish_arr[i] if fish_arr[i].length > longest_fish.length
      longest_fish = fish_arr[j] if fish_arr[j].length > longest_fish.length
    end
  end
  longest_fish
end

def dominant_fishfinder(fish_arr)
  #base case
  return fish_arr[0] if fish_arr.length == 1
  if fish_arr.length == 2
    if fish_arr[0].length > fish_arr[1].length
      fish_arr[0]
    else
      fish_arr[1]
    end
  end

  #recursive case
  half = fish_arr.length / 2
  longest_in_first_half = dominant_fishfinder(fish_arr.take(half))
  longest_in_second_half = dominant_fishfinder(fish_arr.drop(half))
  if longest_in_first_half.length > longest_in_second_half.length
    longest_in_first_half
  else
    longest_in_second_half
  end
end

def linear_fishfinder(fish_arr)
  longest_fish = ""
  fish_arr.length.times do |i|
    if longest_fish.length < fish_arr[i].length
      longest_fish = fish_arr[i]
    end
  end
  longest_fish
end

def slow_dance(str, tiles_arr)
  tiles_arr.length.times do |i|
    return i if str == tiles_arr[i]
  end
end

def fast_dance(str, tiles_arr)
  tiles_hash = Hash[tiles_arr.map.with_index.to_a]
  tiles_hash[str]
end

fish_arr = ['fish', 'fiiish', 'fiiiiish', 'fiiiish','fffish', 'ffiiiiisshh', 'fsh', 'fiiiissshhhhhh']
puts sluggish_fishfinder(fish_arr)
puts dominant_fishfinder(fish_arr)
puts linear_fishfinder(fish_arr)

tiles_array = ["up", "right-up", "right", "right-down", "down", "left-down", "left",  "left-up" ]
puts slow_dance("right-down", tiles_array)
puts slow_dance("right-down", tiles_array)
puts fast_dance("right-down", tiles_array)
puts fast_dance("right-down", tiles_array)
