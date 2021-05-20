require "./lib/letter"

class Word
  attr_accessor :word, :incorrect

  def initialize(word)
    @word = convert(word)
    @incorrect = []
  end

  def convert(word)
    @temp_word = []
    word.split("").each do |char|
      @temp_word.push(Letter.new(char))
    end
    @temp_word
  end

  def show
    output = ""
    @word.each do |char|
      if char.is_found
        output += char.char + " "
      else
        output += "_ "
      end
    end
    output
  end

  def reveal
    output = ""
    @word.each do |char|
      output += char.char
    end
    output
  end

  def check(guess)
    unless @incorrect.include?(guess)
      bad_guess = true
      @word.each do |char|
        if char.check_letter(guess)
          char.is_found = true
          bad_guess = false
        end
      end
      if bad_guess
        @incorrect.push(guess)
      end
    end
  end

  def is_found
    output = true
    @word.each do |char|
      unless char.is_found
        output = false
      end
    end
    output
  end
end
