class BooksController < ApplicationController
   before_action :set_pin, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!, except: [:index, :show]
  before_action :correct_user, only: [:edit, :update, :destroy]
  def new
     @books = Book.new
  end

  def create
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
  
    def set_pin
      @pin = Pin.find(params[:id])
    end

  
    def pin_params
      params.require(:books).permit(:description, :title)
    end

   def correct_user
      @pin = current_user.pins.find_by(id: params[:id])
      redirect_to pins_path, notice: "Not authorized to edit this plan" if @pin.nil?
  end