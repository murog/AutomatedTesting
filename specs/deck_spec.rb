
require_relative 'spec_helper'

describe Deck do
  before do
    @deck = Deck.new
  end

  describe "You can create a Deck instance" do
    it "Can be created" do
      @deck.must_be_instance_of Deck
    end

    it  "Contains 52 card objects as attributes" do
      @deck.contents.length.must_equal 52
    end
  end

  describe "You can shuffle the deck" do
    it "shuffles the deck" do
      @deck.must_respond_to :shuffle
      deck = Deck.new
      initial_contents = deck.contents
      @deck.contents.must_be :!=, initial_contents
    end
  end

  describe "You can draw a card from the deck" do
    it "responds to draw as a method" do
      @deck.must_respond_to :draw
    end

    it "returns the top card of the deck" do
      new_deck = Deck.new
      top_card = new_deck.contents[0]
      hand = new_deck.draw
      hand.must_equal top_card
    end

    it "card is removed from the deck" do
      card = @deck.draw
      does_card_exist = @deck.contents.include?(card)
      does_card_exist.must_equal false
    end

    it "you cannot draw from an empty deck" do
      new_deck = Deck.new
      proc {53.times {new_deck.draw}}.must_raise ArgumentError
    end

  end

  describe "You can count how many cards are left in the deck" do
    it "responds to count method" do
      @deck.must_respond_to :count
      @deck.count.must_equal @deck.contents.length
    end

    it "has one less card after each draw" do
      deck = Deck.new
      initial_count = deck.contents.length
      expected_count = initial_count - 1
      deck.draw
      deck.contents.length.must_equal expected_count
    end
  end
end
