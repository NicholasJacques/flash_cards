require_relative 'deck'
require 'pry'

class Round
  attr_reader :deck,
              :current_card,
              :correct_count

  attr_accessor :guesses
            

  def initialize(deck)
    @deck = deck
    @guesses = []
    @current_card = current_card
    @correct_count = 0
  end

  def current_card
    @current_card = @deck.cards[guesses.count]
    #deck.cards.shift
  end

  def record_guess(guess)
    current_guess = Guess.new(guess, current_card)
    @guesses << (current_guess)
    current_guess
  end

  def number_correct
    guesses.each do |guess|
      if guess.correct?
        @correct_count += 1
      end
    end
    @correct_count
  end

  def percent_correct
    ((@correct_count.to_f / guesses.count)*100).to_i
  end

  def start
    puts "Welcome! You are playing with #{deck.count} cards!"
    puts "-------------------------------------------------------------"


    deck.cards.each do |card|
      puts "This card is card #{(deck.cards.index(current_card)) + 1} of  #{deck.cards.count}"
      puts "#{current_card.question}"
      user_guess = gets.chomp
      record_guess(user_guess)
      puts "#{guesses.last.feedback}"
    end

    puts "*****GAME OVER*****"
    puts "You had #{number_correct} correct guesses out of #{guesses.count} for a score of #{percent_correct}%"
  end

end