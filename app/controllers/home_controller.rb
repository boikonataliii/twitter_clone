class HomeController < ApplicationController

  def index
    @tweet=Tweet.new
    @user = User.new
    @tweets=Tweet.all
    
  end

end
