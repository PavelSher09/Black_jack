require_relative 'deck'
require_relative 'card'
require_relative 'game'
require_relative 'gamer'
require_relative 'bank'
require_relative 'main'

class Main
  attr_accessor :name
  attr_reader :game, :gamer, :cards, :points, :deck

  def create_game
    puts 'Input your name: '
    @name = gets.strip
    @game = Game.new(name)
  end

  def menu
    puts 'Choose what to do '
    puts '1 - Skip turn'
    puts '2 - Take card'
    puts '3 - Open cards '
  end

  def run
    create_game

    loop do
      show_cards
      show_dealer_cards_final

      menu

      input = gets.strip.to_i
      case input
      when 1
        @game.one_more_dealer
      when 2
        @game.one_more_player

      when 3
        p @game.gamer.money
      when 4
      else
        puts 'Wrong input. Please, choose 1, 2 or 3.'
      end
    end
  end

  def show_card(card)
    puts "#{card.rating}#{card.suit} "
   end

  def show_user_cards(gamer, value = 0)
    puts "#{gamer.name} cards (#{value} points): "
  end

  def show_cards
    show_user_cards(game.gamer, game.gamer.points)
    @game.gamer.given_cards.each { |card| show_card(card) }
  end

  def show_dealer_cards(dealer, value = 0)
    puts "#{dealer.name} cards (#{value} points): "
  end

  def show_dealer_cards_final
    show_dealer_cards(game.dealer, game.dealer.points)
    @game.dealer.given_cards.each { |card| show_card(card) }
  end
end
Main.new.run
