class TweetsController < ApplicationController

  def index
    followings_with_self = current_user.following.pluck(:id) << current_user.id
    @tweets = Tweet.where(user_id: followings_with_self).order("id").page(params[:page]).per_page(5)
  end

  def new
    @tweet=Tweet.new
  end

  def create
    @tweet=Tweet.new(tweets_params)
    @tweet.user_id = current_user.id
    if @tweet.save
      redirect_to root_path
    else
      redirect_to root_path
    end
  end

  def destroy
    @tweet = Tweet.find(params[:id])
    @tweet.destroy
    redirect_to root_path
  end

  def show
     @tweet = Tweet.find(params[:id])
  end




  private
  def tweets_params
    params.require(:tweet).permit(:text)
  end
end
