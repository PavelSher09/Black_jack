require_relative 'deck'
require_relative 'card'
require_relative 'gamer'
require_relative 'bank'

class Dealer < Gamer
  attr_reader  :given_cards, :value, :deck, :money, :card

  def initialize(name = 'Dealer')
    super
  end
end
