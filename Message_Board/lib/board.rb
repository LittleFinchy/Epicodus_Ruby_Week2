class Board
  attr_accessor :id, :name
  @@boards = {}
  @@board_num = 0

  def initialize(name, id)
    @name = name
    @id = id || @@board_num += 1
  end

  def self.all
    @@boards.values()
  end

  def save
    @@boards[self.id] = Board.new(self.name, self.id)
  end

  def ==(other_board)
    self.name == other_board.name
  end

  def self.clear
    @@boards = {}
    @@board_num = 0
  end

  def self.find(id)
    @@boards[id]
  end

  def update(name)
    self.name = name
    @@boards[self.id] = Board.new(self.name, self.id)
  end

  def delete()
    @@boards.delete(self.id)
  end

  def self.search(name)
    found = []
    @@boards.values.each do |board|
      if board.name == name
        found.push(board)
      end
    end
    found
  end

  def self.sort()
    @@boards.sort()
  end

  def messages
    Message.find_by_board(self.id)
  end
end
