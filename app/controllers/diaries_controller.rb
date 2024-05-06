class DiariesController < ApplicationController
  def new
    @diary = Diary.new
  end

  def index
    @diaries = Diary.all
    @user = current_user.id

  end

  def show
    @diary = Diary.find(params[:id])
    @user = @diary.user
    @comment = Comment.new
    @comments = @diary.comments
  end

  def edit
  end

  def create
    @diary = Diary.new(diary_params)
    @diary.user_id = current_user.id
    @diary.save
    redirect_to user_path(current_user.id)
  end

  def destroy
    diary = Diary.find(params[:id])
    diary.destroy
    redirect_back fallback_location: root_path
  end

  private

  def diary_params
    params.require(:diary).permit(:description, :image)
  end
end
