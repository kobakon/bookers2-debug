class RelationshipsController < ApplicationController


  # フォローする
  def create
    follower = current_user.relationships.build(followed_id: params[:user_id])
    follower.save!
    redirect_to request.referer
  end

  # フォロー外す
  def destroy
    follower = current_user.relationships.find_by(followed_id: params[:user_id])
    follower.destroy
    redirect_to request.referer
  end
  
  def followings
    user = User.find(params[:user_id])
    @users = user.followings
    
  end
  
  def followers
    user = User.find(params[:user_id])
    @users = user.followers
  end

end
