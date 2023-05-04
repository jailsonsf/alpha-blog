class UsersController < ApplicationController
  before_action :set_user, only: %i[show edit update destroy]

  def show
    @articles = @user.articles.paginate(page: params[:page], per_page: 5)
  end

  def index
    @users = User.paginate(page: params[:page], per_page: 5)
  end

  def new
    @user = User.new
  end

  def edit; end

  def create
    @user = User.new(user_params)
    if @user.save
      flash[:notice] = "Welcome to the Alpha Blog #{@user.username}, you have successfully signed up."
      redirect_to(articles_path)
    else
      render :new
    end
  end

  def update
    if @user.update(user_params)
      flash[:notice] = 'You have successfully updated.'
      redirect_to(@user)
    else
      render :edit
    end
  end

  private

  def set_user
    @user = User.find(params[:id])
  end

  def user_params
    params.require(:user).permit(:username, :email, :password)
  end
end
