class Message
  attr_reader :id
  attr_accessor :content, :board_id

  @@messages = {}
  @@num_of_messages = 0

  def initialize(content, board_id, id)
    @content = content
    @board_id = board_id
    @id = id || @@num_of_messages += 1
  end

  def ==(other_message)
    (self.content == other_message.content)
  end

  def self.all
    @@messages.values
  end

  def save
    @@messages[self.id] = Message.new(self.content, self.board_id, self.id)
  end

  def self.find(id)
    @@messages[id]
  end

  def update(content, board_id)
    self.content = content
    self.board_id = board_id
    @@messages[self.id] = Message.new(self.content, self.board_id, self.id)
  end

  def delete
    @@messages.delete(self.id)
  end

  def self.clear
    @@messages = {}
  end

  def self.find_by_board(temp_board_id)
    found = []
    @@messages.values.each do |message|
      if message.board_id == temp_board_id
        found.push(message)
      end
    end
    found
  end

  def board
    Board.find(self.board_id)
  end
end
