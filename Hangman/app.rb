require "sinatra"
require "sinatra/reloader"
require "./lib/game"
also_reload "lib/**/*.rb"

# game = nil
get("/") do
  @@game = Game.new()
  erb(:stage0)
end

post("/") do
  guess = params[:guess]
  @@game.play(guess)
  unless @@game.is_won
    page = {
      0 => erb(:stage0),
      1 => erb(:stage1),
      2 => erb(:stage2),
      3 => erb(:stage3),
      4 => erb(:stage4),
      5 => erb(:stage5),
      6 => erb(:stage6),
      7 => erb(:fail),
    }
    page[@@game.incorrect_letters.split(" ").length]
  else
    erb(:win)
  end
end
