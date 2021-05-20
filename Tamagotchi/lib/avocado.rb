class Avocado
  @@days = 0
  @@tossed = false

  def water
    @@days += 1
    [
      "Still thirsty!",
      "Was that tap water??",
      "How many house plants have you given up on yet?",
      "I want to be freeee.",
      "Too much water!!",
      "Not enough water!!",
      "I need more sunlight.",
      "Nope! Not gonna drink! You give up yet??",
    ].sample
  end

  def sunlight
    @@days += 1
    [
      "I need sunscreen!",
      "Could you open the window next time?",
      "Just let me gooo.",
      "I miss the outside.",
      "I wont grow until you change my name. ArChiE? Pfft!",
      "Too much sun!!",
      "Not enough sun!!",
      "Now I need a drink.",
      "Nope! Not gonna use the sun! You give up yet??",
    ].sample
  end

  def give_up
    @@days = 0
    @@tossed = true
    [
      "Finally! Freedom!",
      "Mwahahaha, I win.",
      "I knew you didnt have it in you.",
      "Really? You gave up that soon...?",
      "That was awful.",
      "Why dont you love me?!",
      "What did I ever do to you?",
      "How dare you!",
      "Archie has been dead for a while now...",
    ].sample
  end

  def day
    @@days
  end

  def tossed
    @@tossed
  end

  def tossed=(input)
    @@tossed = input
  end
end
