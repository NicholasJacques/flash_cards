=begin
card = Card.new("What is the capital of Alaska?", "Juneau")
card.question
=> "What is the capital of Alaska?"
card.answer
=> "Juneau"
=end

require 'minitest/autorun'
require './lib/card.rb'
require 'minitest/pride'

class CardTest < Minitest::Test

  def test_card_class_exists
    assert Card.new("question", "answer")
  end

  def test_card_contains_questions
    card = Card.new("What is the capital of Alaska?", "Juneau")
    assert_equal "What is the capital of Alaska?", card.question
  end

  def test_card_contains_answer
    card = Card.new("What is the capital of Alaska?", "Juneau")
    assert_equal "Juneau", card.answer
  end
end