require "./lib/room"

class Maze
  attr_accessor :current_room, :key_status

  def build
    @@key_status = "Not found"
    cols = 4
    rows = 4
    #make grid of rooms
    @grid = []
    rows.times do |x|
      @grid.push([])
      cols.times do |y|
        @grid[x].push(Room.new("white", x, y, nil))
      end
    end

    #place red, yellow, and blue rooms
    red = [0, 0]
    yellow = [1, 1]
    blue = [1, 1]
    until red != yellow && yellow != blue && red != blue
      yellow[0] = [0, 1, 2, 3].sample[0]
      yellow[1] = [0, 1, 2, 3].sample[0]
      blue[0] = [0, 1, 2, 3].sample[0]
      blue[1] = [0, 1, 2, 3].sample[0]
    end
    @grid[0][0].name = "red"
    @grid[yellow[0]][yellow[1]].name = "yellow"
    @grid[blue[0]][blue[1]].name = "blue"

    #place walls
    vertical = [[0, 1, 2].sample[0], [0, 1, 2].sample[0]]
    horizontal = [[1, 2, 3].sample[0], [1, 2, 3].sample[0]]
    rows.times do |x|
      cols.times do |y|
        if x == 0
          @grid[x][y].build_wall("left")
        end
        if x == 3
          @grid[x][y].build_wall("right")
        end
        if y == 0
          @grid[x][y].build_wall("up")
        end
        if y == 3
          @grid[x][y].build_wall("down")
        end
        if x == 0 && y == vertical[0]
          @grid[x][y].build_wall("right")
          @grid[x + 1][y].build_wall("left")
        end
        if x == 2 && y == vertical[1]
          @grid[x][y].build_wall("right")
          @grid[x + 1][y].build_wall("left")
        end
        if x == 1 && y == horizontal[0]
          @grid[x][y].build_wall("up")
          @grid[x][y - 1].build_wall("down")
        end
        if x == 3 && y == horizontal[1]
          @grid[x][y].build_wall("up")
          @grid[x][y - 1].build_wall("down")
        end
      end
    end
    @@current_room = @grid[0][0]
  end

  def current_room
    @@current_room
  end

  def move(pos)
    movement = {
      "up" => [@@current_room.location[0], @@current_room.location[1] - 1],
      "right" => [@@current_room.location[0] + 1, @@current_room.location[1]],
      "down" => [@@current_room.location[0], @@current_room.location[1] + 1],
      "left" => [@@current_room.location[0] - 1, @@current_room.location[1]],
    }
    x = movement[pos][0]
    y = movement[pos][1]
    @@current_room = @grid[x][y]
  end

  def key_status
    @@key_status
  end

  def key_status=(new)
    @@key_status = new
  end
end
