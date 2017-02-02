require_relative 'round'
require_relative 'guess'
require_relative 'card'
require_relative 'deck'
require './lib/card_generator'
require 'pry'

filename = "cards.txt"

cards = CardGenerator.new.cards_gen
deck = Deck.new(cards)
round = Round.new(deck)


round.start