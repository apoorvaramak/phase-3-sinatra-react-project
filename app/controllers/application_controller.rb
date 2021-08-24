class ApplicationController < Sinatra::Base
  set :default_content_type, 'application/json'
  
  # Add your routes here
  get "/" do
    { message: "epic job team :)" }.to_json
  end

  get '/books' do
    books = Book.all
<<<<<<< HEAD
    books.to_json(include: :reviews)
=======
    books.to_json(include: { reviews: {include: :user} })
>>>>>>> fc78845604a76bf7f1e2c205635d2771a0fe139d
  end

  get "/books/:id" do
    book = Book.find(params[:id])
    book.to_json(include: { reviews: {include: :user} })
  end

  get "/users" do
    users = User.all
<<<<<<< HEAD
    users.to_json(include: :reviews)
=======
    users.to_json(include: { reviews: {include: :book} })
>>>>>>> fc78845604a76bf7f1e2c205635d2771a0fe139d
  end

  get "/users/:id" do
    user = User.find(params[:id])
    user.to_json(include: { reviews: {include: :book} })
  end

  get "/reviews/:id" do
    review = Review.find(params[:id])
    review.to_json({:include => [:user, :book]})
<<<<<<< HEAD

=======
>>>>>>> fc78845604a76bf7f1e2c205635d2771a0fe139d
  end

  post "/books/add" do
    book = Book.create(
      author: params[:author],
      title: params[:title],
      genre: params[:genre],
      publisher: params[:publisher],
      page_count: params[:page_count]
    )
    book.to_json
  end

  post "/reviews/add" do
    review = Review.create(
      content: params[:content],
      rating: params[:rating]
    )
    review.to_json
  end

  delete "/books/:id" do
    book = Book.find(params[:id]).destroy_all
    book.to_json
  end

  delete "/reviews/:id" do
    review = Review.find(params[:id]).destroy_all
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
    review = Review.find(params[:id])
    review.update(
      content: params[:content],
      rating: params[:rating]
    )
    review.to_json
  end






end
