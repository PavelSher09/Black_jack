require_relative 'deck'
require_relative 'card'
require_relative 'gamer'
require_relative 'dealer'

class Game
  attr_reader :deck, :gamer, :name, :dealer

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

  # rubocop:disable Metrics/CyclomaticComplexity
  # rubocop:disable Metrics/PerceivedComplexity

  def define_winner(gamer_points, dealer_points)
    if (gamer_points > dealer_points && gamer_points < 22) || dealer_points > 21
      winner = @gamer

    elsif (dealer_points > gamer_points && dealer_points < 22) || gamer_points > 21
      winner = @dealer

    elsif gamer_points > 21 && dealer_points > 21
      winner = nil
    elsif gamer_points == dealer_points
      winner = nil

    end
  end

  # rubocop:enable Metrics/PerceivedComplexity
  # rubocop:enable Metrics/CyclomaticComplexity

  def three_cards?
    @gamer.given_cards.size == 3 || @dealer.given_cards.size == 3
  end

  def get_money(_gamer_points, _dealer_points)
    winner = define_winner(@gamer.points, @dealer.points)

    if winner
      winner.money += @bank

      p @dealer.money
      p @gamer.money
      p "#{winner.name} wins"
    elsif p 'Tie!'
      @gamer.money += @bank / 2
      @dealer.money += @bank / 2

    end
  end

  def check_money
    if @dealer.money <= 0
      p @dealer.money
      p 'Gamer wins'
      abort
    elsif @gamer.money <= 0
      p 'Dealer wins'
      abort
    end
  end
end
