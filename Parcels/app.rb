require("sinatra")
require("./lib/parcel")
require("sinatra/reloader")
also_reload("lib/**/*.rb")

get("/") do
  @parcels = Parcel.all
  erb(:parcels)
end

get("/parcels") do
  @parcels = Parcel.all
  erb(:parcels)
end

get("/parcels/new") do
  erb(:new_parcel)
end

post("/parcels") do
  l = params[:parcel_length].to_i
  w = params[:parcel_width].to_i
  h = params[:parcel_height].to_i
  weight = params[:parcel_weight].to_i
  parcel = Parcel.new(weight, l, w, h, nil)
  parcel.save()
  @parcels = Parcel.all()
  erb(:parcels)
end

get("/parcels/:id") do
  @parcel = Parcel.find(params[:id].to_i())
  erb(:parcel)
end

get("/parcels/:id/edit") do
  @parcel = Parcel.find(params[:id].to_i())
  erb(:edit_parcel)
end

patch("/parcels/:id") do
  @parcel = Parcel.find(params[:id].to_i())
  @parcel.update(params[:weight].to_i, params[:l].to_i, params[:w].to_i, params[:h].to_i)
  @parcels = Parcel.all()
  erb(:parcels)
end

delete("/parcels/:id") do
  @parcel = Parcel.find(params[:id].to_i())
  @parcel.delete()
  @parcels = Parcel.all()
  erb(:parcels)
end

get("/parcels/:id/cost") do
  @parcel = Parcel.find(params[:id].to_i())
  erb(:cost_parcel)
end
