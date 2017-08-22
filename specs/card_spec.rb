
require_relative 'spec_helper'

describe Card do
  before do
    @card = Card.new
  end
  describe "You can create a Card instance" do

    it "Can be created" do
      [:hearts, :spades, :clubs, :diamonds].each do |suit|
        (1..13).each do |value|
          card = Card.new(value, suit)
          card.must_be_instance_of Card
        end
      end
    end

    it "Raises an ArgumentError for invalid parameters" do
      proc {Card.new(0, :diamonds)}.must_raise ArgumentError
      proc {Card.new(14, :diamonds)}.must_raise ArgumentError
      proc {Card.new(14, :clovers)}.must_raise ArgumentError

      proc {Card.new(-5, :diamonds)}.must_raise ArgumentError

      proc {Card.new(3.5, :diamonds)}.must_raise ArgumentError

    end
  end

  describe "Testing to_s" do

    it "to_s returns a readable String value logically for values 2-10" do
      Card.new(5, :diamonds).to_s.must_equal "5 of Diamonds"
      Card.new(10, :hearts).to_s.must_equal "10 of Hearts"
      Card.new(3, :spades).to_s.must_equal "3 of Spades"
      Card.new(7, :clubs).to_s.must_equal "7 of Clubs"
    end

    it "to_s returns a readable String value for Ace, Jack, Queen, King" do
      Card.new(11, :spades).to_s.must_equal "Jack of Spades"
      Card.new(12, :clubs).to_s.must_equal "Queen of Clubs"
      Card.new(13, :diamonds).to_s.must_equal "King of Diamonds"
      Card.new(1, :diamonds).to_s.must_equal "Ace of Diamonds"
    end # end it

  describe "Reader methods" do

    it "Can retrieve the value of the card using a `.value`." do
      @card.must_respond_to :value
      Card.new(5, :diamonds).value.must_equal 5
      Card.new(10, :hearts).value.must_equal 10
      Card.new("Queen", :clubs).value.must_equal 12
      Card.new("Ace", :clubs).value.must_equal 1
    end

    it "Can retrieve the value of the card using a `.suit`." do
      @card.must_respond_to :suit
      Card.new(5, :diamonds).suit.must_equal :diamonds
      Card.new(10, :hearts).suit.must_equal :hearts
      Card.new("Queen", :clubs).suit.must_equal :clubs
      Card.new("Ace", :clubs).suit.must_equal :clubs
    end
  end

end
end
