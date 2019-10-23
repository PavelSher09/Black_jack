require_relative 'deck'
require_relative 'card'
require_relative 'gamer'
require_relative 'dealer'

class Game
  attr_reader :deck, :gamer, :name, :given_cards, :cards, :dealer, :money

  def initialize(name)
    @gamer = Gamer.new(name)
    @deck = Deck.new
    @dealer = Dealer.new
    @bank = Bank.new(name)

    deal

  end

  def deal
    @bank = @gamer.bet + @dealer.bet

    @gamer.take_card(deck)
    @dealer.take_card(deck)
  end

  def one_more_player
    @gamer.given_cards << @deck.cards.pop
  end

  def one_more_dealer
    @dealer.given_cards << @deck.cards.pop if @dealer.points < 17


  end

  def open_cards
    gamer_points = @gamer.points
    dealer_points = @dealer.points
    get_money(gamer_points, dealer_points)
  end

  def define_winner(gamer_points,dealer_points)

    if (gamer_points > dealer_points && gamer_points < 22) || dealer_points > 21
    winner = @gamer
    elsif (dealer_points > gamer_points && dealer_points < 22) || gamer_points > 21
    winner = @dealer
    elsif
      gamer_points > 21 && dealer_points > 21

    elsif
      gamer_points == dealer_points


    end
  end

  def get_money(gamer_points, dealer_points)
    winner = define_winner(@gamer.points, @dealer.points)
      if winner = @gamer
        @gamer.money += @bank
        p winner
        p @gamer.money
      elsif winner = @dealer
        @dealer.money += @bank
        p @winner
        p @dealer.money
      elsif
        p "TIE"

      end
    end


end
