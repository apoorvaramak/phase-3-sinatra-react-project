require 'pry'
class ApplicationController < Sinatra::Base
  set :default_content_type, 'application/json'
  
  # Add your routes here
  get "/" do
    { message: "epic job team :)" }.to_json
  end

  get '/books' do
    books = Book.all
    books.to_json(include: { reviews: {include: :user} })
  end

  get "/books/:id" do
    book = Book.find(params[:id])
    book.to_json(include: { reviews: {include: :user} })
  end

  get "/users" do
    users = User.all
    users.to_json(include: { reviews: {include: :book} })
  end

  get "/users/:id" do
    user = User.find(params[:id])
    user.to_json(include: { reviews: {include: :book} })
  end

  get "/reviews/:id" do
    review = Review.find(params[:id])
    review.to_json({:include => [:user, :book]})
  end

  post "/books/add" do
    params = JSON.parse(request.body.read)
    book = Book.create(
      title: params["title"],
      author: params["author"],
      publisher: params["publisher"],
      genre: params["genre"],
      page_count: params["page_count"]
    )
    book.to_json(include: { reviews: {include: :user} })
  end

  post "/reviews/add" do
    params = JSON.parse(request.body.read)
    # binding.pry
    review = Review.create(
      content: params["content"],
      rating: params["rating"],
      book_id: params["book_id"],
      user_id: params["user_id"]
    )
    review.to_json
  end

  delete "/books/:id" do
    book = Book.find(params[:id]).destroy_all
    book.to_json
  end

  delete "/reviews/:id" do
    params = JSON.parse(request.body.read)
    review = Review.find(params["id"])
    review.destroy
    review.to_json
  end

  patch "/books/:id/edit" do
    book = Book.find(params[:id])
    book.update(
      author: params[:author],
      title: params[:title],
      genre: params[:genre],
      publisher: params[:publisher],
      page_count: params[:page_count]
    )
    book.to_json
  end

  patch "/reviews/:id" do
    params = JSON.parse(request.body.read)
    review = Review.find(params["id"])
    review.update(
      content: params["content"],
      rating: params["rating"],
      book_id: params["book_id"]
    )
    review.to_json
  end






end
