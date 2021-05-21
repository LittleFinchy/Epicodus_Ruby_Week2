require "rspec"
require "maze"

describe "#Maze" do
  describe("#maze") do
    it("returns the current room you are in") do
      maze = Maze.new()
      maze.build
      expect(maze.current_room.location).to(eq([0, 0]))
    end

    it("returns the walls for the current room you are in") do
      maze = Maze.new()
      maze.build
      expect(maze.current_room.walls.include?("left")).to(eq(true))
    end

    it("returns the current key status") do
      maze = Maze.new()
      maze.build
      expect(maze.key_status).to(eq("Not found"))
    end

    it("moves down") do
      maze = Maze.new()
      maze.build
      maze.move("down")
      expect(maze.current_room.location).to(eq([0, 1]))
    end
  end
end
