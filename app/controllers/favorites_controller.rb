class FavoritesController < ApplicationController
  def index
    @diaries = current_user.favorite_diaries
  end


  def create
    diary = Diary.find(params[:diary_id])
    favorite = current_user.favorites.new(diary_id: diary.id)
    favorite.save
    redirect_to diary_comments_path(diary)
  end

  def destroy
    favorite = current_user.favorites.find_by(diary_id: params[:diary_id])
    favorite.destroy
    redirect_back fallback_location: root_path
  end


end
