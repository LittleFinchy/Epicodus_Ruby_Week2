class Stage
  attr_accessor :id, :stage_name, :music_style
  @@stages = {}
  @@stage_num = 0

  def initialize(stage_name, music_style, id)
    @stage_name = stage_name
    @music_style = music_style
    @id = id || @@stage_num += 1
  end

  def self.all
    @@stages.values()
  end

  def save
    @@stages[self.id] = Stage.new(self.stage_name, self.music_style, self.id)
  end

  def ==(other_stage)
    self.stage_name == other_stage.stage_name && self.music_style == other_stage.music_style
  end

  def self.clear
    @@stages = {}
    @@stage_num = 0
  end

  def self.find(id)
    @@stages[id]
  end

  def update(stage_name, music_style)
    self.stage_name = stage_name
    self.music_style = music_style
    @@stages[self.id] = Stage.new(self.stage_name, self.music_style, self.id)
  end

  def delete()
    @@stages.delete(self.id)
  end

  def self.search(stage_name)
    found = []
    @@stages.values.each do |stage|
      if stage.stage_name == stage_name
        found.push(stage)
      end
    end
    found
  end

  def self.sort()
    @@stages.sort()
  end

  def artists
    Artist.find_by_stage(self.id)
  end
end
