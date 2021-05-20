class Album
  attr_reader :id, :name
  attr_accessor :name, :artist, :year
  @@albums = {}
  @@total_rows = 0

  def initialize(name, artist, year, id)
    @name = name
    @artist = artist
    @year = year
    @id = id || @@total_rows += 1
  end

  def self.all
    @@albums.values()
  end

  def save
    @@albums[self.id] = Album.new(self.name, @artist, @year, self.id)
  end

  def ==(album_to_compare)
    self.name() == album_to_compare.name()
  end

  def self.clear
    @@albums = {}
    @@total_rows = 0
  end

  def self.find(id)
    @@albums[id]
  end

  def update(name, artist, year)
    self.name = name
    self.artist = artist
    self.year = year
    @@albums[self.id] = Album.new(self.name, self.artist, self.year, self.id)
  end

  def delete()
    @@albums.delete(self.id)
  end

  def self.search(name)
    found = []
    @@albums.values.each do |album|
      if album.name == name
        found.push(album)
      end
    end
    found
  end

  def self.sort()
    @@albums.sort()
  end

  def songs
    Song.find_by_album(self.id)
  end
end
