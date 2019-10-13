require_relative 'deck'
require_relative 'card'
require_relative 'game'
require_relative 'bank'


class Gamer
  attr_accessor  :name
  attr_reader  :given_cards,  :value,  :deck,  :money,  :card



  def initialize(name)

    @name = name
    @given_cards = []
    @money = 100
    @given_cards = []
  end

def deal
  @deck = Deck.new



  @given_cards = deck.cards.pop(2)
end

  def one_more
    @given_cards << deck.cards.pop

  end

  def points

   @points = 0
   @given_cards.each do |card|
     @points += card.value.to_i
   end
   p @points


  end
end
