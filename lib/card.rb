
# card.rb

class Card
  attr_reader :value, :suit

  def initialize(value = Random.rand(13) + 1, suit = [:hearts, :spades, :clubs, :diamonds].sample)
    if !(value.to_i >= 0 && value.to_i < 14)
      raise ArgumentError.new "Valid value for cards are any number between 1 and 13"
    elsif !((value.is_a? Integer)  || (value.is_a? String))
      raise ArgumentError.new "Valid values for cards must be whole numbers or Ace, Jack, Queen, King"
    elsif value.to_i == 0 && value.to_s == value.to_i.to_s
      raise ArgumentError.new "Valid inputs for cards must be greater than 0 "
    elsif ![:hearts, :spades, :clubs, :diamonds].include? suit
      raise ArgumentError.new "Valid suits for cards are hearts, spades, clubs and diamonds"
    else
      if value.is_a? String
        if !["ACE", "JACK", "QUEEN", "KING"].include? value.upcase
        raise ArgumentError.new "Valid string values for cards are Ace, Jack, Queen, King"
        end
      end
      case value
      when 2..10
        @value = value
      when 1, "ACE", "ace", "Ace"
        @value = 1
      when 11, "JACK", "jack", "Jack"
        @value = 11
      when 12, "QUEEN", "queen", "Queen"
        @value = 12
      when 13, "KING", "king", "King"
        @value = 13
      end
      @suit = suit
    end
  end #end of initialize

  def to_s
    case @value
    when 1
      card_value = "Ace"
    when 11
      card_value = "Jack"
    when 12
      card_value = "Queen"
    when 13
      card_value = "King"
    else
      card_value = @value
    end
    return "#{card_value} of #{suit.to_s.capitalize}"
  end

end
