class Artist
  attr_reader :id
  attr_accessor :name, :stage_id

  @@artists = {}
  @@num_of_artists = 0

  def initialize(name, stage_id, id)
    @name = name
    @stage_id = stage_id
    @id = id || @@num_of_artists += 1
  end

  def ==(other_artist)
    (self.name == other_artist.name)
  end

  def self.all
    @@artists.values
  end

  def save
    @@artists[self.id] = Artist.new(self.name, self.stage_id, self.id)
  end

  def self.find(id)
    @@artists[id]
  end

  def update(name, stage_id)
    self.name = name
    self.stage_id = stage_id
    @@artists[self.id] = Artist.new(self.name, self.stage_id, self.id)
  end

  def delete
    @@artists.delete(self.id)
  end

  def self.clear
    @@artists = {}
  end

  def self.find_by_stage(temp_stage_id)
    found = []
    @@artists.values.each do |artist|
      if artist.stage_id == temp_stage_id
        found.push(artist)
      end
    end
    found
  end

  def stage
    Stage.find(self.stage_id)
  end
end
