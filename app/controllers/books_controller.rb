class BooksController < ApplicationController
  def new
     @books = Book.new
  end

  def create
   @books = current_user.books.build(book_params)
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
