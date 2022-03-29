class UsersController < ApplicationController

  before_action :ensure_current_user, only: [:edit, :update]
  def ensure_current_user
    @user = User.find(params[:id])
    if @user.id != current_user.id
       redirect_to user_path(current_user)
    end
  end

  def new
    @user = User.new
    redirect_to user_path, notice: "Welcome! You have signed up successfully."
  end

  def show
    @new = Book.new
    @user = User.find(params[:id])
    @books = @user.books
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
   @user =User.find(params[:id])
    if @user.update(user_params)
      redirect_to user_path, notice: "You have updated user successfully."
    else
       render :edit

    end
  end

  def index
    @user = current_user
    @book = Book.new
    @users = User.all
  end

  def destroy
    redirect_to root_path, notice: "Signed out successfully."
  end

  private

  def user_params
    params.require(:user).permit(:name, :profile_image, :introduction)
  end
end
