class Riddle
  # attr_reader :index
  @@riddles = {
    "What can run, but never walks; has a mouth, but never talks; has a head, but never weeps; has a bed, but never sleeps?" => "River",
    "What is large, yet never grows; has roots that cannot be seen; and is taller than trees?" => "Mountain",
    "At night they come without being fetched, and by day they are lost without being stolen." => "Stars",
    "too far" => "stop",
  }

  @@index = 0

  def initialize(guess)
    @guess = guess
  end

  def self.ask
    @@index += 1
    @@riddles.keys[@@index - 1]
  end

  def self.answer
    @@riddles.values[@@index]
  end

  def check
    @guess == @@riddles.values[@@index - 1]
  end

  def self.zero
    @@index = 0
  end

  def index
    @@index
  end
end
