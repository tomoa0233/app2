class BooksController < ApplicationController
  before_action :ensure_current_user, only: [:edit, :update, :destroy]
  def ensure_current_user
    @book = Book.find(params[:id])
    @user = @book.user
    if @user.id != current_user.id
       redirect_to books_path
    end
  end

  def create
    @book = Book.new(book_params)
    @book.user_id = current_user.id
    @books = Book.all
    if @book.save
     redirect_to book_path(@book.id), notice: "You have created book successfully."
    else
     render :index
     
    end
  end

  def index
    @book = Book.new
    @books = Book.all
  end

  def show
    @new = Book.new
    @book = Book.find(params[:id])
    @user = @book.user
    @books = current_user.books
  end

  def edit
    @book = Book.find(params[:id])
  end

  def update
    @book = Book.find(params[:id])
    if @book.update(book_params)
     redirect_to book_path(@book.id), notice: "You have created book successfully."
    else
      render :edit

    end
  end

  def destroy
    @book = Book.find(params[:id])
    @book.destroy
    redirect_to books_path
  end

  private

  def book_params
    params.require(:book).permit(:title, :body)
  end
end
