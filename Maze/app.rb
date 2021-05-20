require "sinatra"
require "sinatra/reloader"
require "./lib/maze"
require "pry"
also_reload "lib/**/*.rb"

get("/") do
  @@maze = Maze.new()
  @@maze.build
  erb(:room)
end

get("/end") do
  erb(:end)
end

post("/up") do
  @@maze.move("up")
  erb(:room)
end

post("/right") do
  @@maze.move("right")
  erb(:room)
end

post("/down") do
  @@maze.move("down")
  erb(:room)
end

post("/left") do
  @@maze.move("left")
  erb(:room)
end
