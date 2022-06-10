class BooksController < ApplicationController
  load_and_authorize_resource

  def new
    @book = Book.new 
  end

  def show
  end

  def create 
    @book.user_id = current_user.id
    if @book.save
      redirect_to root_path
    end
  end

  def index
    @books = Book.all
  end

  def edit 
  end

  def update
    if @book.update(book_params)
      redirect_to root_path
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @book.destroy
    redirect_to root_path
  end

  private
    def book_params
      params.require(:book).permit(:title)
    end
end
