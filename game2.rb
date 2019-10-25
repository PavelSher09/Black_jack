require_relative 'deck'
require_relative 'card'
require_relative 'gamer'

class Game
  attr_reader :name, :value, :rank, :deck, :money, :given_cards, :gamer, :game

  def initialize(name)
    @game = game
    @gamer = Gamer.new(name)
  end

  def deal
    @deck = Deck.new
    @gamer.given_cards = []

    @gamer.given_cards = deck.cards.pop(2)
    end

  def one_more(_name)
    @gamer.given_cards << deck.cards.pop
  end

  def to_s
    @name
  end
end
