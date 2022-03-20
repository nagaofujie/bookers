class BooksController < ApplicationController
  def new

  end

  def create

    @book =Book.new(book_params)
    if @book.save
      flash[:notice] = "Book was successfully created."
    redirect_to book_path(@book)
    else
      @books=Book.all
      render :index

    end
  end

  def index
    @book = Book.new
    @books=Book.all
  end

  def show
    @book = Book.find(params[:id])
  end

  def edit
    @book = Book.find(params[:id])
  end

  def update
    @book = Book.find(params[:id])
    flash[:notice] = "Book was successfully updated."
    if @book.update(book_params)
    redirect_to book_path(@book)
    else
    render :edit
    end
  end

  def destroy
    book =Book.find(params[:id])
    flash[:notice] = "Book was successfully destroyed."
    book.destroy
    redirect_to'/books'
  end

  private
  def book_params
    params.require(:book).permit(:title,:body)
  end
end
