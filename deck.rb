require_relative 'card'

class Deck
  attr_accessor :cards
  rating = %w[2 3 4 5 6 7 8 9 10 J Q K A]
  suit = %w[♠ ♥ ♦ ♣]

  def initialize
    @cards = []
    @suit.each do |suit|
      @rating.each do |rating|
          @cards << Card.new(suit, rating)
        end
      end
    end


end

