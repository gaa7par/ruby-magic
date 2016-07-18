class Hero
  attr_accessor :name, :strength, :agility, :intelligence

  def initialize(name, strength = 0, agility = 0, intelligence = 0)
    @name = name
    @strength = strength
    @agility = agility
    @intelligence = intelligence
    @used = false
  end

  def to_s
    "#{@name} => #{@strength} : #{@agility} : #{@intelligence}"
  end
end

class Knight < Hero
  def rage
    if @used
      puts "You cannot do that again, wicked!"
    else
      @strength *= 2
      @agility += 2
      @used = true
    end
  end
end

class Thief < Hero
  def stab
    if @used
      puts "You cannot do that again, wicked!"
    else
      @strength += 3
      @agility += 4
      @used = true
    end
  end
end

class Mage < Hero
  def heal
    if @used
      puts "You cannot do that again, wicked!"
    else
      @strength *= 0.5
      @agility += 2
      @intelligence *= 3
      @used = true
    end
  end
end

# Add heroes
alpha = Knight.new("Alpha", 9, 1, 3)
bravo = Knight.new("Bravo", 7, 5, 5)

charlie = Thief.new("Charlie", 3, 9, 8)
delta = Thief.new("Delta", 7, 7, 3)

echo = Mage.new("Echo", 5, 3, 10)
foxtrot = Mage.new("Foxtrot", 3, 7, 8)

# Test
puts alpha.to_s
alpha.rage
puts alpha.to_s
puts
puts charlie.to_s
charlie.stab
puts charlie.to_s
charlie.stab
puts charlie.to_s
