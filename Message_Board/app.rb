require("sinatra")
require("sinatra/reloader")
require("./lib/board")
require("./lib/message")
also_reload("lib/**/*.rb")

get("/") do
  @boards = Board.all
  erb(:boards)
end

get("/boards") do
  @boards = Board.all
  erb(:boards)
end

get("/boards/new") do
  erb(:new_board)
end

get("/boards/:id") do
  @board = Board.find(params[:id].to_i())
  erb(:board)
end

post("/boards") do
  name = params[:name]
  board = Board.new(name, nil)
  board.save()
  @boards = Board.all()
  erb(:boards)
end

get("/boards/:id/edit") do
  @board = Board.find(params[:id].to_i())
  erb(:edit_board)
end

patch("/boards/:id") do
  @board = Board.find(params[:id].to_i())
  @board.update(params[:name])
  @boards = Board.all
  erb(:boards)
end

delete("/boards/:id") do
  @board = Board.find(params[:id].to_i())
  @board.delete()
  @boards = Board.all
  erb(:boards)
end

get("/boards/:id/messages/:message_id") do
  @message = Message.find(params[:message_id].to_i())
  erb(:message)
end

post("/boards/:id/messages") do
  @board = Board.find(params[:id].to_i())
  message = Message.new(params[:content], @board.id, nil)
  message.save()
  erb(:board)
end

patch("/boards/:id/messages/:message_id") do
  @board = Board.find(params[:id].to_i())
  message = Message.find(params[:message_id].to_i())
  message.update(params[:content], @board.id)
  erb(:board)
end

delete("/boards/:id/messages/:message_id") do
  message = Message.find(params[:message_id].to_i())
  message.delete
  @board = Board.find(params[:id].to_i())
  erb(:board)
end
