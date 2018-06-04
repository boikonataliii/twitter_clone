class UsersController < ApplicationController
  skip_before_action :authenticate_user, only: [:new, :create]

  def index
     @users=User.all
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)

    if @user.save
      redirect_to root_path
    else
      render :new
    end
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])

    if @user.update(user_params)

      redirect_to root_path
    else
      render :edit
    end
  end

  def show
      @user = User.find(params[:id])
  end


  def following
      @title = "Following"
      @user  = User.find(params[:id])
      @users = @user.following.paginate(page: params[:page])
      render 'show_follow'
  end

  def followers
      @title = "Followers"
      @user  = User.find(params[:id])
      @users = @user.followers.paginate(page: params[:page])
      render 'show_follow'
  end

  

  private

  def user_params
    params.require(:user).permit(:last_name, :first_name, :email, :password,
                                 :password_confirmation, :avatar, :followed, :follower)
  end
end
