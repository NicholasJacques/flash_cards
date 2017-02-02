class CardGenerator
  attr_reader :filename

  def initialize(filename="cards.txt")
    @filename = filename
    @cards_gen = []
  end

  def cards_gen
    lines = File.open(@filename).readlines
    cards = []
    lines.each do |line|
      question = line.split(",")[0]
      answer = line.split(",")[1].chomp
      cards << Card.new(question, answer)
    end
    cards 
  end
end
