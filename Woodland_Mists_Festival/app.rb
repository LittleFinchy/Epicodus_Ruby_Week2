require("sinatra")
require("sinatra/reloader")
require("./lib/stage")
require("./lib/artist")
require("pry")
also_reload("lib/**/*.rb")

get("/") do
  @stages = Stage.all
  erb(:stages)
end

get("/stages") do
  @stages = Stage.all
  erb(:stages)
end

get("/stages/new") do
  erb(:new_stage)
end

get("/stages/:id") do
  @stage = Stage.find(params[:id].to_i())
  erb(:stage)
end

post("/stages") do
  name = params[:stage_name]
  style = params[:music_style]
  stage = Stage.new(name, style, nil)
  stage.save()
  @stages = Stage.all()
  erb(:stages)
end

get("/stages/:id/edit") do
  @stage = Stage.find(params[:id].to_i())
  erb(:edit_stage)
end

patch("/stages/:id") do
  @stage = Stage.find(params[:id].to_i())
  @stage.update(params[:name])
  @stages = Stage.all
  erb(:stages)
end

delete("/stages/:id") do
  @stage = Stage.find(params[:id].to_i())
  @stage.delete()
  @stages = Stage.all
  erb(:stages)
end

# Get the detail for a specific artist such as lyrics and artistwriters.
get("/stages/:id/artists/:artist_id") do
  @artist = Artist.find(params[:artist_id].to_i())
  erb(:artist)
end

# Post a new artist. After the artist is added, Sinatra will route to the view for the stage the artist belongs to.
post("/stages/:id/artists") do
  @stage = Stage.find(params[:id].to_i())
  artist = Artist.new(params[:artist_name], @stage.id, nil)
  artist.save()
  erb(:stage)
end

# Edit a artist and then route back to the stage view.
patch("/stages/:id/artists/:artist_id") do
  @stage = Stage.find(params[:id].to_i())
  artist = Artist.find(params[:artist_id].to_i())
  artist.update(params[:name], @stage.id)
  erb(:stage)
end

# Delete a artist and then route back to the stage view.
delete("/stages/:id/artists/:artist_id") do
  artist = Artist.find(params[:artist_id].to_i())
  artist.delete
  @stage = Stage.find(params[:id].to_i())
  erb(:stage)
end
