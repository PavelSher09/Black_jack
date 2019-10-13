require_relative 'deck'
require_relative 'card'
require_relative 'gamer'


class Game

attr_reader  :deck,  :gamer,  :name

def initialize(name)

  @gamer = Gamer.new(name)
  @gamer.deal

end



end

