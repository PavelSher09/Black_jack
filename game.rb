require_relative 'deck'
require_relative 'card'
require_relative 'gamer'
require_relative 'dealer'

class Game
  attr_reader :deck, :gamer, :name, :given_cards, :cards, :dealer, :money

  def initialize(name)
    @gamer = Gamer.new(name)
    @deck = Deck.new
    @dealer = Dealer.new
    @bank = Bank.new(name)

    deal
    end

  def deal
    @bank = @gamer.bet + @dealer.bet

    @gamer.take_card(deck)
    @dealer.take_card(deck)
  end

  def one_more_player
    @gamer.given_cards << @deck.cards.pop
  end

  def one_more_dealer
    @dealer.given_cards << @deck.cards.pop if @dealer.points < 17
  end
end
