class BooksController < InheritedResources::Base

  def create 
    book = Book.new(book_params)
    book.user_id = current_user.id
    if book.save
      redirect_to root_path
    end
  end

  def index
    @books = Book.all
  end

  def edit
    @book = Book.find(params[:id])
    if can? :edit, @book
      render :edit
    else
      flash[:alert] = "You Are not authorised to update this!!"
      redirect_to root_path
    end
  end

  private
    def book_params
      params.require(:book).permit(:title)
    end
end
