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
      if @book.update(pin_params)
        redirect_to @book, notice: 'Pin was successfully updated.' 
      else
        render action: 'edit'
      end
  end
  
  def edit
     
  end
  
  def destroy
    @book.destroy
     redirect_to books_url
  end

  def index
    @book = Book.all.order("created_at DESC")
  end


  def show
    @book = Book.find(params[:id])
  end
end

private
  
  def set_book
      @book = Book.find_by(id: params[:id])
  end

  def book_params
      params.require(:book).permit(:description, :title)
  end

  def correct_user
      @book = current_user.books.find_by(id: params[:id])
      redirect_to books_path, notice: "Not authorized to edit this plan" if @book.nil?
  end