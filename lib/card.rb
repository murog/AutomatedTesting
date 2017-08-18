
# card.rb

class Card
  attr_reader :value, :suit

  def initialize(value = Random.rand(13) + 1, suit = [:hearts, :spades, :clubs, :diamonds].sample)
    if !(value > 0 && value < 14)
      raise ArgumentError.new "Valid value for cards are any number between 1 and 13"
    elsif !value.is_a? Integer
      raise ArgumentError.new "Valid values for cards must be whole numbers"
    elsif ![:hearts, :spades, :clubs, :diamonds].include? suit
      raise ArgumentError.new "Valid suits for cards are hearts, spades, clubs and diamonds"
    else
    @value = value
    @suit = suit
    end
  end #end of initialize

  def to_s
    return "#{value} of #{suit.to_s}"
  end

end
