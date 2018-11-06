class FavoritesController < ApplicationController
  before_action :require_user_logged_in
  
  def create
    Favorite.find_or_create_by(favorite_params)
    flash[:success] = 'ツイートをお気に入りしました。'
    redirect_to likes_user_path(current_user)
  end

  def destroy
    Favorite.find_or_create_by(favorite_params).destroy
    flash[:success] = 'ツイートのお気に入りを解除しました。'
    redirect_to likes_user_path(current_user)
  end
  
  def index
  end  
  
  private
  
  def favorite_params
    params.require(:favorite).permit(:user_id, :micropost_id)
  end
end  
