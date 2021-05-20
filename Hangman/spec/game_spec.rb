require "rspec"
require "game"
require "word"
require "letter"

describe "#Game" do
  describe("#is_over?") do
    it("game show works") do
      temp_game = Game.new()
      expect(temp_game.show.length > 3).to(eq(true))
    end

    it("game reveal works") do
      temp_game = Game.new()
      expect(temp_game.reveal.length > 3).to(eq(true))
    end

    it("game incorrect letters works") do
      temp_game = Game.new()
      temp_game.play("zzzz")
      expect(temp_game.incorrect_letters).to(eq("zzzz"))
    end

    it("game is won works") do
      temp_game = Game.new()
      expect(temp_game.is_won).to(eq(false))
    end
  end
end
