require "rspec"
require "stage"

describe "#Stage" do
  before(:each) do
    Stage.clear()
  end

  describe("#save") do
    it("saves a stage") do
      stage = Stage.new("Main Stage", "Rap", nil)
      stage.save()
      stage2 = Stage.new("Mini Stage", "Hip-Hop", nil)
      stage2.save()
      expect(Stage.all).to(eq([stage, stage2]))
    end
  end

  describe(".all") do
    it("returns an empty array when there are no stages") do
      expect(Stage.all).to(eq([]))
    end
  end

  describe(".clear") do
    it("clears all stages") do
      stage = Stage.new("Main Stage", "Rap", nil)
      stage.save()
      stage2 = Stage.new("Mini Stage", "Hip-Hop", nil)
      stage2.save()
      Stage.clear()
      expect(Stage.all).to(eq([]))
    end
  end
  describe("#==") do
    it("is the same stage if it has the same attributes as another stage") do
      stage = Stage.new("Mini Stage", "Hip-Hop", nil)
      stage2 = Stage.new("Mini Stage", "Hip-Hop", nil)
      expect(stage).to(eq(stage2))
    end
  end

  describe(".find") do
    it("finds a stage by id") do
      stage = Stage.new("Main Stage", "Rap", nil)
      stage.save()
      stage2 = Stage.new("Mini Stage", "Hip-Hop", nil)
      stage2.save()
      expect(Stage.find(stage.id)).to(eq(stage))
    end
  end

  describe("#update") do
    it("updates a stage by id") do
      stage = Stage.new("Main Stage", "Rap", nil)
      stage.save()
      stage.update("Not Main Stage", stage.music_style)
      expect(stage.stage_name).to(eq("Not Main Stage"))
    end
  end

  describe("#delete") do
    it("deletes a stage by id") do
      stage = Stage.new("Main Stage", "Rap", nil)
      stage.save()
      stage2 = Stage.new("Mini Stage", "Hip-Hop", nil)
      stage2.save()
      stage.delete()
      expect(Stage.all).to(eq([stage2]))
    end
  end

  describe("#search") do
    it("finds a stage by name") do
      stage = Stage.new("Main Stage", "Rap", nil)
      stage.save()
      stage2 = Stage.new("Mini Stage", "Hip-Hop", nil)
      stage2.save()
      expect(Stage.search("Mini Stage")).to(eq([stage2]))
    end
  end

  # describe("#songs") do
  #   it("returns a stage's songs") do
  #     stage = Stage.new("Main Stage", "Rap", nil)
  #     stage.save()
  #     song = Song.new("Naima", stage.id, nil)
  #     song.save()
  #     song2 = Song.new("Cousin Mary", stage.id, nil)
  #     song2.save()
  #     expect(stage.songs).to(eq([song, song2]))
  #   end
  # end
end
