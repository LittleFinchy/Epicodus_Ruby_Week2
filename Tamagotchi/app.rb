require("sinatra")
require("./lib/avocado")
require("sinatra/reloader")
also_reload("lib/**/*.rb")

get("/") do
  @@arch = Avocado.new()
  erb(:avocado)
end

post("/water") do
  @@reply = @@arch.water
  erb(:feedback)
end

post("/sunlight") do
  @@reply = @@arch.sunlight
  erb(:feedback)
end

post("/toss") do
  @@reply = @@arch.give_up
  erb(:feedback)
end
