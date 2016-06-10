class Competitor
  attr_accessor :name, :language

  def initialize(name, language)
    @name = name
    @language = language
  end

  # Show a competitor and their language
  def show
    "#{@name} who speaks #{@language}"
  end
end

class Competition
  def initialize
    @competitors = []

    @the_same_person = false
    @the_same_language = false
    @too_many = false
  end

  # Add a competitor
  def add(competitor)
    @competitors << competitor
  end

  # List all competitors
  def list
    @competitors.each { |competitor| puts competitor.show }
  end

  # Pair opponents
  def pair(number_of_pairs = 1)

    message = "Sorry but you requested too many opponents!"

    number_of_pairs.times do
      if @competitors.length != 0
        select
      else
        @too_many = true
      end
    end

    puts message if @too_many
  end

  # Select opponents
  def select
    opponent1 = @competitors[rand(@competitors.length)]
    opponent2 = @competitors[rand(@competitors.length)]

    @the_same_person = opponent1 == opponent2
    @the_same_language = opponent1.language == opponent2.language

    if !@the_same_person && @the_same_language
      puts "#{opponent1.show} vs #{opponent2.show}"
      @competitors.delete(opponent1)
      @competitors.delete(opponent2)
    else
      select
    end
  end
end


# Add competitors

competitor1 = Competitor.new("John", "English")
competitor2 = Competitor.new("Sue", "English")
competitor3 = Competitor.new("Mike", "English")
competitor4 = Competitor.new("Frank", "English")
competitor5 = Competitor.new("Joe", "English")
competitor6 = Competitor.new("Sam", "English")
competitor7 = Competitor.new("Gizela", "German")
competitor8 = Competitor.new("Marlene", "German")
competitor9 = Competitor.new("Français", "French")
competitor10 = Competitor.new("Maalik", "French")
competitor11 = Competitor.new("Nathan", "French")
competitor12 = Competitor.new("Hugo", "French")
competitor13 = Competitor.new("Alvaro", "Spanish")
competitor14 = Competitor.new("Ramona", "Spanish")
competitor15 = Competitor.new("Gabriel", "Portuguese")
competitor16 = Competitor.new("Leo", "Portuguese")
competitor17 = Competitor.new("Иван", "Russian")
competitor18 = Competitor.new("Саша", "Russian")


# Add competition

competition = Competition.new


# Add competitors to the competition

competition.add(competitor1)
competition.add(competitor2)
competition.add(competitor3)
competition.add(competitor4)
competition.add(competitor5)
competition.add(competitor6)
competition.add(competitor7)
competition.add(competitor8)
competition.add(competitor9)
competition.add(competitor10)
competition.add(competitor11)
competition.add(competitor12)
competition.add(competitor13)
competition.add(competitor14)
competition.add(competitor15)
competition.add(competitor16)
competition.add(competitor17)
competition.add(competitor18)


# Show output

# puts competitor13.show
# competition.list
competition.pair(10)
