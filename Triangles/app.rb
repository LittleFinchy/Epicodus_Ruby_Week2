require("sinatra")
require("./lib/triangles")
require("sinatra/reloader")
also_reload("lib/**/*.rb")

get("/") do
  erb(:triangle)
end

post("/test") do
  @triangle = Triangle.new(params[:a].to_i, params[:b].to_i, params[:c].to_i)
  erb(:triangle_test)
end
