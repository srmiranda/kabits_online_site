require 'sinatra'
require 'pg'
require 'pry'

def db_connection
  begin
    connection = PG.connect(dbname: "kabits")
    yield connection
  ensure
    connection.close
  end
end

# def grocery_item_find(id)
#   db_connection do |conn|
#     sql_query = "SELECT * FROM groceries WHERE id = $1"
#     data = [id]
#     conn.exec_params(sql_query, data).first
#   end
# end
#
def list_item_save(params)
  unless params["list"].empty?
    db_connection do |conn|
      sql_query = "INSERT INTO list (activity) VALUES ($1)"
      data = [params["list"]]
      conn.exec_params(sql_query, data)
    end
  end
end
#
# def edit_grocery_item(params)
#   unless params["grocery"].empty?
#     db_connection do |conn|
#       id = params["id"]
#       new_item = params["grocery"]
#       new_amount = params["amount"]
#       conn.exec_params('UPDATE groceries SET (name, amount) = ($1, $2) WHERE id = $3',
#       [new_item, new_amount, id])
#     end
#   end
# end
#
# def grocery_comments(id)
#   db_connection do |conn|
#     sql_query = "SELECT groceries.*, comments.* FROM groceries
#     JOIN comments ON groceries.id = comments.grocery_id
#     WHERE groceries.id = $1"
#     data = [id]
#     conn.exec_params(sql_query, data)
#   end
# end
#
# def comment_save(params)
#   db_connection do |conn|
#     sql_query = "INSERT INTO comments (comment, grocery_id) VALUES ($1, $2)"
#     data = [params["comment"], params["id"]]
#     conn.exec_params(sql_query, data)
#   end
# end

get '/' do
  redirect '/kabits'
end

get '/kabits' do
  list = []
  db_connection do |conn|
    list = conn.exec_params("SELECT id, activity FROM list")
  end
  erb :index, locals: { list: list, id: params[:id] }
end

# get "/groceries/:id" do
#   item = grocery_item_find(params[:id])
#   comments = grocery_comments(params[:id])
#   erb :listing, locals: { item: item, comments: comments }
# end
#
# get "/groceries/:id/edit" do
#   item = grocery_item_find(params[:id])
#   erb :edit, locals: { item: item, id: params[:id], name: params[:grocery], amount: params[:amount] }
# end
#
post "/list" do
  list_item_save(params)
  redirect "/kabits"
end

# post "/list/:id/comments" do
#   comment_save(params)
#   redirect "/list/" + params[:id]
# end
#
delete "/list/:id" do
  db_connection do |conn|
    conn.exec_params('DELETE FROM list WHERE id = ($1)', [params[:id]])
  end
  redirect "/kabits"
end
#
# patch "/groceries/:id" do
#   edit_grocery_item(params)
#   redirect "/groceries/" + params[:id]
# end
