require "rspec"
require "avocado"

describe("Avocado") do
  before(:each) do
    @water_reply = [
      "Still thirsty!",
      "Was that tap water??",
      "How many house plants have you given up on yet?",
      "I want to be freeee.",
      "Too much water!!",
      "Not enough water!!",
      "I need more sunlight.",
      "Nope! Not gonna drink! You give up yet??",
    ]
    @sunlight_reply = [
      "I need sunscreen!",
      "Could you open the window next time?",
      "Just let me gooo.",
      "I miss the outside.",
      "I wont grow until you change my name. ArChiE? Pfft!",
      "Too much sun!!",
      "Not enough sun!!",
      "Now I need a drink.",
      "Nope! Not gonna use the sun! You give up yet??",
    ]
    @tossed_reply = [
      "Finally! Freedom!",
      "Mwahahaha, I win.",
      "I knew you didnt have it in you.",
      "Really? You gave up that soon...?",
      "That was awful.",
      "Why dont you love me?!",
      "What did I ever do to you?",
      "How dare you!",
      "Archie has been dead for a while now...",
    ]
  end

  describe("#water") do
    it("returns an answer about water") do
      temp = Avocado.new()
      expect(@water_reply.include?(temp.water)).to eq(true)
    end
  end

  describe("#sunlight") do
    it("returns the first answer") do
      temp = Avocado.new()
      expect(@sunlight_reply.include?(temp.sunlight)).to eq(true)
    end
  end

  describe("#toss") do
    it("returns true if guess matches answer") do
      temp = Avocado.new()
      expect(@tossed_reply.include?(temp.give_up)).to eq(true)
    end
  end
end
