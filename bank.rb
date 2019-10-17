

require_relative 'deck'
require_relative 'card'
require_relative 'gamer'
require_relative 'bank'
require_relative 'game'

class Bank
  attr_reader :bank

  def initialize(_name)
    @bank = 0
  end
end
