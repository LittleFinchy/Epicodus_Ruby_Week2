class Room
  attr_accessor :name, :num_of_rooms, :id, :walls, :location
  @@rooms = {}
  @@room_id = 0

  def initialize(name, x, y, id)
    @name = name
    @x = x
    @y = y
    @location = [x, y]
    @walls = []
    @id = id || @@room_id += 1
  end

  def self.all_rooms
    @@rooms.values()
  end

  def save
    @@rooms[self.id] = Room.new(self.name, self.id)
  end

  def self.clear
    @@rooms = {}
    @@room_id = 0
  end

  def self.find(id)
    @@rooms[id]
  end

  def update(name)
    self.name = name
    @@rooms[self.id] = Room.new(self.name, @x, @y, self.id)
  end

  def delete()
    @@rooms.delete(self.id)
  end

  def build_wall(side)
    # wall_side = { "up" => 0, "right" => 1, "down" => 2, "left" => 3 }
    @walls.push(side)
  end

  def walls
    @walls
  end
end
