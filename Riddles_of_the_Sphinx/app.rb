require("sinatra")
require("sinatra/reloader")
require("./lib/riddle")
require("pry")
also_reload("lib/**/*.rb")

get("/") do
  Riddle.zero
  @riddle = Riddle.ask
  erb(:riddles)
end

post("/") do
  guess = Riddle.new(params[:guess])
  if guess.check
    if guess.index == 3
      erb(:success)
    else
      @riddle = Riddle.ask
      erb(:riddles)
    end
  else
    erb(:failure)
  end
end
