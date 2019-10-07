require_relative 'card'

class Deck
  attr_accessor :cards
  attr_reader :suit,  :rating,  :value,  :card

  def initialize
    @cards = []
    @card = []
    Card::SUIT.each do |suit|
      Card::RATING.each do |rating, value|
          @cards << Card.new(suit, rating, value)
          @cards.shuffle!
        end
      end
    end

end


