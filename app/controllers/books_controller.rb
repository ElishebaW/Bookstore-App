class BooksController < ApplicationController
  def new
     @books = Book.new
  end

  def create
    @books = Book.new
  if @books.save
    redirect_to new_book_path
  end
   
  end

  def update
  end

  def edit
  end

  def destroy
  end

  def index
    @books = Book.all
  end


  def show
    @books = Book.find(params[:id])
  end
end
