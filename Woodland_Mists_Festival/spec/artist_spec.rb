require "rspec"
require "stage"
require "artist"
require "pry"

describe "#Artist" do
  before(:each) do
    Stage.clear()
    Artist.clear()
    @stage = Stage.new("Main Stage", "Rap", nil)
    @stage.save()
  end

  describe("#==") do
    it("is the same artist if it has the same attributes as another artist") do
      artist = Artist.new("Naima", @stage.id, nil)
      atrist2 = Artist.new("Naima", @stage.id, nil)
      expect(artist).to(eq(atrist2))
    end
  end

  describe(".all") do
    it("returns a list of all artists") do
      artist = Artist.new("Giant Steps", @stage.id, nil)
      artist.save()
      atrist2 = Artist.new("Naima", @stage.id, nil)
      atrist2.save()
      expect(Artist.all).to(eq([artist, atrist2]))
    end
  end

  describe(".clear") do
    it("clears all artists") do
      artist = Artist.new("Giant Steps", @stage.id, nil)
      artist.save()
      atrist2 = Artist.new("Naima", @stage.id, nil)
      atrist2.save()
      Artist.clear()
      expect(Artist.all).to(eq([]))
    end
  end

  describe("#save") do
    it("saves a artist") do
      artist = Artist.new("Naima", @stage.id, nil)
      artist.save()
      expect(Artist.all).to(eq([artist]))
    end
  end

  describe(".find") do
    it("finds a song by id") do
      artist = Artist.new("Giant Steps", @stage.id, nil)
      artist.save()
      atrist2 = Artist.new("Naima", @stage.id, nil)
      atrist2.save()
      expect(Artist.find(artist.id)).to(eq(artist))
    end
  end

  describe("#update") do
    it("updates an artist by id") do
      artist = Artist.new("Naima", @stage.id, nil)
      artist.save()
      artist.update("Mr. P.C.", @stage.id)
      expect(artist.name).to(eq("Mr. P.C."))
    end
  end

  describe("#delete") do
    it("deletes an artist by id") do
      artist = Artist.new("Giant Steps", @stage.id, nil)
      artist.save()
      atrist2 = Artist.new("Naima", @stage.id, nil)
      atrist2.save()
      artist.delete()
      expect(Artist.all).to(eq([atrist2]))
    end
  end

  describe(".find_by_stage") do
    it("finds artists for a stage") do
      stage2 = Stage.new("Main Stage", "Rap", nil)
      stage2.save
      artist = Artist.new("Bobby", @stage.id, nil)
      artist.save()
      atrist2 = Artist.new("Timmy", stage2.id, nil)
      atrist2.save()
      expect(Artist.find_by_stage(stage2.id)).to(eq([atrist2]))
    end
  end

  describe("#stage") do
    it("finds the stage a artist belongs to") do
      artist = Artist.new("Naima", @stage.id, nil)
      artist.save()
      expect(artist.stage()).to(eq(@stage))
    end
  end
end
