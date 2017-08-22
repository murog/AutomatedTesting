
# deck.rb

require_relative 'card'

class Deck
  attr_reader :contents
  attr_accessor :contents

  def initialize
    @contents = []
    [:hearts, :spades, :clubs, :diamonds].each do |suit|
      (1..13).each do |value|
        card = Card.new(value, suit)
        @contents << card
      end
    end
    @contents.shuffle!
  end

  def draw
    hand = @contents[0]
    @contents.delete_at(0)
    return hand
  end

  def count
    return @contents.length
  end

  def shuffle
    @contents.shuffle!
  end

end
