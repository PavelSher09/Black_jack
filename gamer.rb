require_relative 'deck'
require_relative 'card'
require_relative 'game'
require_relative 'bank'

class Gamer
  attr_accessor :name, :money, :value
  attr_reader :given_cards, :deck, :cards, :game

  BET = 10

  def initialize(name)
    @name = name
    @given_cards = []
    @money = 100
  end

  def bet
    BET
  end

  def take_card(deck)
    @given_cards = deck.cards.pop(2)
    @money -= BET
  end

  def one_more(deck)
    deck.cards.pop << @given_cards
  end

  def points
    @points = @given_cards.sum(&:value)
    @given_cards.each do |card|
      @points -= 10 if card.rating == 'A' && @points > 21
    end

    @points
  end
end
