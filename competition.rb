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

