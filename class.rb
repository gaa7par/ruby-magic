class Animal
  attr_accessor :name, :age, :type

  def initialize(name, age, type)
    @name = name
    @age = age
    @type = type
  end

  def move
    "#{@name} moves like a(n) #{@type}!"
  end
end

class Fish < Animal
end

class Amphibian < Animal
end

class Reptile < Animal
end

class Bird < Animal
end

class Mammal < Animal
end

# Add animals

# dog = Animal.new("Rex", 3, "dog")
# p dog.move
dog = Mammal.new("Rex", 3, "dog")
p dog.move
