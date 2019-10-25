require_relative 'deck'
require_relative 'card'
require_relative 'game'
require_relative 'bank'

class Gamer
  attr_accessor :name,  :money
  attr_reader :given_cards, :value, :deck, :cards, :game

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
    @points = 0
    @given_cards.each do |card|
      @points += card.value.to_i
    end
    @points -= 10 if aces? && @points > 21
    @points
  end

  def aces?
    @given_cards.any? { |card| rating = 'A' }
  end

end
