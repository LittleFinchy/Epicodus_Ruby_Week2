require "rspec"
require "board"

describe "#Board" do
  before(:each) do
    Board.clear()
  end

  describe("#save") do
    it("saves a board") do
      board = Board.new("test", nil)
      board.save()
      board2 = Board.new("Blue", nil)
      board2.save()
      expect(Board.all).to(eq([board, board2]))
    end
  end

  describe(".all") do
    it("returns an empty array when there are no boards") do
      expect(Board.all).to(eq([]))
    end
  end

  describe(".clear") do
    it("clears all boards") do
      board = Board.new("Giant Steps", nil)
      board.save()
      board2 = Board.new("Blue", nil)
      board2.save()
      Board.clear()
      expect(Board.all).to(eq([]))
    end
  end
  describe("#==") do
    it("is the same board if it has the same attributes as another board") do
      board = Board.new("Blue", nil)
      board2 = Board.new("Blue", nil)
      expect(board).to(eq(board2))
    end
  end

  describe(".find") do
    it("finds an board by id") do
      board = Board.new("Giant Steps", nil)
      board.save()
      board2 = Board.new("Blue", nil)
      board2.save()
      expect(Board.find(board.id)).to(eq(board))
    end
  end

  describe("#update") do
    it("updates an board by id") do
      board = Board.new("Giant Steps", nil)
      board.save()
      board.update("Love")
      expect(board.name).to(eq("Love"))
    end
  end

  describe("#delete") do
    it("deletes an board by id") do
      board = Board.new("Giant Steps", nil)
      board.save()
      board2 = Board.new("Blue", nil)
      board2.save()
      board.delete()
      expect(Board.all).to(eq([board2]))
    end
  end
end
