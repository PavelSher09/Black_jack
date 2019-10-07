require_relative 'deck'
require_relative 'card'
require_relative 'game'
require_relative 'bank'

class Gamer

  attr_reader :cards,  :name,  :value,  :rank,  :deck,  :money,  :card

  def initialize(name)
    @money = 100
    @name = name
    @deck = Deck.new
    @given_card = []




  end


  def give_card
     @given_card = deck.cards.pop(2)

  end

  def one_more
    @given_card << deck.cards.pop(1)
  end

  def points
    @points = 0
    @given_card.each do |card|
      @points += card.value.to_i
    end
    p @points
  end





end




