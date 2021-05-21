require "rspec"
require "riddle"

describe("Riddle") do
  before(:each) do
    Riddle.zero
  end

  describe("#ask") do
    it("returns the first riddle") do
      expect(Riddle.ask).to eq("What can run, but never walks; has a mouth, but never talks; has a head, but never weeps; has a bed, but never sleeps?")
    end
  end

  describe("#answer") do
    it("returns the first answer") do
      expect(Riddle.answer).to eq("River")
    end
  end

  describe("#check") do
    it("returns true if guess matches answer") do
      temp = Riddle.new("Stars")
      expect(temp.check).to eq(true)
    end
  end
end
