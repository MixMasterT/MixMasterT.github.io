class Stack
   def initialize
     @stack = []
   end

   def add(el)
     @stack << el
   end

   def remove
     @stack.pop
   end

   def show
     @stack.dup
   end
 end

class Queue
   def initialize
     @queue = []
   end

   def queue(el)
     @queue = [el] + @queue
   end

   def dequeue
     @queue.pop
   end

   def show
     @queue.dup
   end
 end

class Map
  def initialize
    @map = []
  end

  def assign(key, val)
    if duplicate?(key)
      matching_key_idx = get_key_index(key)
      @map[matching_key_idx] = [key, val]
    else
      @map << [key, val]
    end
  end

  def lookup(key)
    p get_key_index(key)
    @map[get_key_index(key)][1]
  end

  def remove(key)
    index_for_removal = get_key_index(key)
    @map = @map.take(index_for_removal) + @map.drop(index_for_removal + 1)
  end

  def show
    @map.dup
  end

  private
    def duplicate?(key)
      @map.any? { |pair| key == pair[0] }
    end

    def get_key_index(key)
      return "key not found" unless duplicate?(key)
      @map.find_index { |pair| key == pair[0] }
    end
end#Tests
if __FILE__ == $PROGRAM_NAME

#STACK
#pushes
s = Stack.new
8.times do |t|
  s.add(t + 1)
end
p s.show

#pops
8.times { |t| puts s.remove }

#maintains FILO
#Look over the output...

#MAP TESTS
m = Map.new
letters = ('a'..'h').to_a
#adds
8.times  { |t|  m.assign(letters[t], t) }

#looks right
m.show

#looks up
val_at_g = m.lookup('g')

val_at_h = m.lookup('h')
puts val_at_g
puts val_at_h

#removes
m.remove('c')
m.show

#QUE TESTS
q = Queue.new

#enques
8.times  { |t|  q.queue(t + 1) }

q.show

#deques
8.times { |t| puts q.dequeue }

#maintains FIFO
#Look over the output...

end
