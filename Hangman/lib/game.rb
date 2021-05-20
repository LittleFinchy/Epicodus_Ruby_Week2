require "./lib/word"
require "./lib/letter"
require_relative "word_list"

class Game
  def initialize
    @@word_hidden = Word.new(get_word)
  end

  def show
    @@word_hidden.show
  end

  def reveal
    @@word_hidden.reveal
  end

  def play(guess)
    @@word_hidden.check(guess)
  end

  def incorrect_letters
    @@word_hidden.incorrect.sort.join(" ")
  end

  def is_won
    @@word_hidden.is_found
  end
end
