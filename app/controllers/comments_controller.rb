class CommentsController < ApplicationController
  def new
  end

  def index
    @user = current_user
    @diary = Diary.find(params[:diary_id])
    @comments = @diary.comments.all
    @comment = Comment.new
  end

  def show
    @diary = Diary.find(params[:id])
  end

  def edit
  end

  def create
    diary = Diary.find(params[:diary_id])
    comment = current_user.comments.new(comment_params)
    comment.diary_id = diary.id
    comment.save
    redirect_back(fallback_location: root_path)
  end

  def destroy
    comment = current_user.comments.find_by(diary_id: params[:diary_id], id: params[:id])
    comment.destroy
    redirect_to diary_comments_path(params[:diary_id])
  end


  private

  def comment_params
    params.require(:comment).permit(:comment)
  end
end
