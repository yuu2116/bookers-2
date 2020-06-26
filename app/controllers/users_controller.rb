class UsersController < ApplicationController
  before_action :authenticate_user!, only: [:edit,:index,:show]
  
  
  def show
    @user = User.find(params[:id])
    @books = @user.books
    @book = Book.new
    end

    def edit
      @user = User.find(params[:id])
      if current_user != @user
        redirect_to user_path(current_user.id)
  
      end
  end
    def index
      @users = User.all
      @user = current_user
      @book = Book.new
  end

  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
    flash[:notice] = "Info was successfully created."
    redirect_to user_path(@user.id)
    else
    render 'edit'
    end
end
private 
def user_params
    params.require(:user).permit(:name, :introduction,:profile_image)
end
end
