require_relative 'card'

class Deck
  attr_accessor :cards
  attr_reader :suit,  :rating,  :value

  def initialize
    @cards = []

    Card::SUIT.each do |suit|
      Card::RATING.each do |rating, value|
          @cards << Card.new(suit, rating, value)
          @cards.shuffle!



        end
      end
    end

end


