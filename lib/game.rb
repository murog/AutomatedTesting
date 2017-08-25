require_relative 'deck'
require_relative 'card'
class Player
  @@max_id = 0
  attr_accessor :hand, :win, :id
  def initialize
    @id = @@max_id
    @hand = []
    @win = false
    @@max_id += 1
  end
end # end of player class



class Blackjack
  attr_reader :players, :deck
  attr_accessor :discard_pile
  def initialize(num_players)
    @players = []
    @num = num_players
    i = 1
    until i >= @num
      @num.times do
        @players.push(Player.new)
        i += 1
      end
    end
    @deck = Deck.new
    @discard_pile = []

  end
  def deal(player_id, card_amount)
    @players.each do |player|
      if player.id == player_id
        temp_hand = []
        card_amount.times do
          temp_hand << @deck.draw
        end # => card amt times
        player.hand = temp_hand
        return true
      end # => if end
    end # => players.each
    raise ArgumentError.new "Player ID does not exist"
  end # => def deal


end
