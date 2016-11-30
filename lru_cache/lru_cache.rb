class LRUCache
  attr_reader :max_length
  def initialize(num_vals)
    @max_length = num_vals
    @data_store = {}
  end

  def count
    @data_store.count
  end

  def add(el)
    if @data_store.include?(el)
      old_idx = @data_store[el]
      puts "OLD IDX is #{old_idx}"

      increment_vals(0, old_idx - 1)

      @data_store[el] = 0
    else
      if count > max_length - 1
        remove
      end
      increment_vals(0, @data_store.count - 1)
      @data_store[el] = 0
    end
  end

  def show
    p @data_store
    strings = @data_store.keys.sort { |k, k2| @data_store[k] <=> @data_store[k2] }
    puts "LRU CONTAINS: #{strings.join(' | ')}"
  end

  private
  # helper methods go here!
  def remove
    oldest_key = @data_store.key(max_length - 1)
    @data_store.delete(oldest_key)
  end

  def increment_vals(start, finish)
    (start..finish).each do |idx|
      k = @data_store.key(idx)
      @data_store[k] += 1
    end
  end
end


if __FILE__ == $PROGRAM_NAME
  lrn = LRUCache.new(3)
  lrn.add("hello")
  lrn.add("goodbye")
  lrn.add("sucka")
  lrn.add("goodbye")
  lrn.show
  lrn.add("whassup?")
  puts
  puts "add whassup?"
  puts
  lrn.add("howdy")
  puts
  puts "add howdy"
  puts
  lrn.add("goodbye")
  puts
  puts "add goodbye"
  puts
  lrn.add("howdy")
  puts
  puts "add howdy"
  puts
  lrn.show


  johnny_cache = LRUCache.new(4)

  johnny_cache.add([1, 2, 3])
  johnny_cache.add(5)
  johnny_cache.add(-5)
  johnny_cache.add({a: 1, b: 2, c: 3})
  johnny_cache.add([1, 2, 3, 4])
  johnny_cache.add("I walk the line")
  puts " ADD " + "I walk the line"
  johnny_cache.show
  johnny_cache.add(:ring_of_fire)
  puts "ADD :ring_of_fire"
  johnny_cache.show
  johnny_cache.add("I walk the line")
  puts "ADD " + "I walk the line"
  johnny_cache.show
  johnny_cache.add({a: 1, b: 2, c: 3})
  puts "ADD {a: 1, b: 2, c: 3}"
  johnny_cache.show
end
