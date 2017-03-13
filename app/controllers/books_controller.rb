class BooksController < ApplicationController
  before_action :set_book, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!, except: [:index, :show]
  before_action :correct_user, only: [:edit, :update, :destroy]
  
  def new
     @book = current_user.books.build
  end

  def create
     @book = current_user.books.build(book_params)
      if @book.save
        redirect_to @book, notice: 'Book was successfully created.' 
      else
        render action: 'new'
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

private
  
  def set_book
      @book = Book.find(params[:id])
  end

  def book_params
      params.require(:book).permit(:description, :title)
  end

  def correct_user
      @book = current_user.books.find_by(id: params[:id])
      redirect_to books_path, notice: "Not authorized to edit this plan" if @book.nil?
  end