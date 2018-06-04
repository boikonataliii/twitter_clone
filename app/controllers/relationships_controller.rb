class RelationshipsController < ApplicationController
  def create
    relationship = Relationship.new(follower_id: current_user.id, followed_id: params[:followed_id] )
    relationship.save
    redirect_to user_path(id: params[:followed_id])
  end

  def destroy

    user = Relationship.find(params[:id]).followed
   current_user.unfollow(user)
   redirect_to user
  end
end
