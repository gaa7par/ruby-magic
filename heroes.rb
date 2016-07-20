class Hero
  attr_accessor :name, :strength, :agility, :intelligence
  attr_reader :hp, :mana, :attack, :luck, :total_points

  def initialize(name, strength = 0, agility = 0, intelligence = 0)
    raise "You're cheating, wicked!" if strength > 10 || agility > 10 || intelligence > 10

    @name = name
    @strength = strength
    @agility = agility
    @intelligence = intelligence

    @hp = 2 * strength + agility
    @mana = 3 * intelligence
    @attack = strength > intelligence ? 3 * strength : 3 * intelligence
    @luck = (10 * agility)

    @total_points = 2 * (hp + mana) + 3 * attack + rand(luck)

    @warning = "You cannot do that again, wicked!"
    @used = false
  end

  def to_s
    "#{self.class} #{name} => #{strength} : #{agility} : #{intelligence}"
  end

  def stats
    "#{self.class} #{name} => hp: #{hp} | mana: #{mana} | attack: #{attack} | luck: #{luck}"
  end
end

class Knight < Hero
  def rage
    if used
      puts warning
    else
      strength *= 2
      agility += 2
      used = true
    end
  end
end

class Thief < Hero
  def stab
    if used
      puts warning
    else
      strength += 3
      agility += 4
      used = true
    end
  end
end

class Mage < Hero
  def heal
    if used
      puts warning
    else
      strength *= 0.5
      agility += 2
      intelligence *= 3
      used = true
    end
  end
end

class Tournament
  attr_accessor :name, :heroes, :heroes_copy

  def initialize(name)
    @name = name
    @heroes = Array.new
    @heroes_copy = Array.new
  end

  def add(hero)
    heroes << hero
    heroes_copy << hero
  end

  def list
    heroes.each do |hero|
      puts hero.to_s
    end
  end

  def list_stats
    heroes.each do |hero|
      puts hero.stats
    end
  end

  def fight
    if heroes.empty?
      "There's no heroes yet!"
    elsif heroes.count == 1
      "Add more heroes to continue!"
    else
      pair_heroes
    end
  end

  def pair_heroes
    heroes.each do |hero1|
      heroes_copy.each do |hero2|
        if hero1 != hero2
          find_winners(hero1, hero2)
        end
      end
      heroes_copy.delete(hero1)
    end
  end

  def find_winners(hero1, hero2)
    puts "#{hero1.name} vs #{hero2.name}"
    puts "===>|<==="
    if hero1.total_points > hero2.total_points
      puts "#{hero1.name} won!"
    elsif hero1.total_points < hero2.total_points
      puts "#{hero2.name} won!"
    else
      puts "undefined"
    end
    puts
  end
end


# Add heroes
alpha = Knight.new("Alpha", 9, 1, 3)
bravo = Knight.new("Bravo", 7, 5, 5)

charlie = Thief.new("Charlie", 3, 9, 8)
delta = Thief.new("Delta", 7, 7, 3)

echo = Mage.new("Echo", 5, 3, 10)
foxtrot = Mage.new("Foxtrot", 3, 7, 8)


# Add a tournament
lancaster = Tournament.new("Lancaster")


# Add heroes to the tournament
lancaster.add(alpha)
lancaster.add(bravo)
lancaster.add(charlie)
lancaster.add(delta)
lancaster.add(echo)
lancaster.add(foxtrot)


# Test
# puts alpha.to_s
# puts alpha.stats

# lancaster.list
# lancaster.list_stats

# Uncomment this and watch the result!
# alpha.rage
# charlie.stab
# echo.heal

lancaster.fight
