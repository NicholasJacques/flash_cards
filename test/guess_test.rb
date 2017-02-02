require 'minitest/autorun'
require './lib/guess.rb'
require 'minitest/pride'

=begin
card = Card.new("What is the capital of Alaska?", "Juneau")
guess = Guess.new("Juneau", card)
guess.card
=> #<Card:0x007ffdf1820a90 @answer="Juneau", @question="What is the capital of Alaska?">
guess.response
=> "Juneau"
guess.correct?
=> true
guess.feedback
=> "Correct!"
=end



class GuessTest < Minitest::Test
  def test_guess_class_exists
    card = Card.new("What is the capital of Alaska?", "Juneau")
    assert Guess.new("Juneau", card)
  end

  def test_guess_can_access_card
    card = Card.new("What is the capital of Alaska?", "Juneau")
    guess = Guess.new("Juneau", card)
    assert_equal card, guess.card
  end

  def test_has_response
    card = Card.new("What is the capital of Alaska?", "Juneau")
    guess = Guess.new("Juneau", card)
    assert_equal "Juneau", guess.response
  end

  def test_check_for_correct
    card = Card.new("What is the capital of Alaska?", "Juneau")
    guess = Guess.new("Juneau", card)
    assert guess.correct?
  end

  def test_gives_feedback_correct
    card = Card.new("What is the capital of Alaska?", "Juneau")
    guess = Guess.new("Juneau", card)
    assert_equal "Correct!", guess.feedback
  end

=begin
card = Card.new("Which planet is closest to the sun?", "Mercury")
guess = Guess.new("Saturn", card)
guess.card
=> #<Card:0x007ffdf1820a90 @answer="Mercury", @question="Which planet is closest to the sun?">
guess.response
=> "Saturn"
guess.correct?
=> false
guess.feedback
=> "Incorrect."
=end

  def test_check_for_incorrect
    card = Card.new("Which planet is closest to the sun?", "Mercury")
    guess = Guess.new("Saturn", card)
    refute guess.correct?
  end

  def test_gives_incorrect_feedback
    card = Card.new("Which planet is closest to the sun?", "Mercury")
    guess = Guess.new("Saturn", card)
    assert_equal "Incorrect!", guess.feedback
  end
end
