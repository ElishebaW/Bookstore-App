class BooksController < ApplicationController
  def new
     @books = Book.new
  end

  def create
   
  end

  def update
  end

  def edit
  end

  def destroy
  end

  def index
  end

  def show
    @books = Book.find(params[:id])
  end
end
