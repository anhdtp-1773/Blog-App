class CommentsController < ApplicationController
  before_action :load_entry
  before_action :load_comment, only: %i(destroy edit update comment_owner)
  before_action :comment_owner, only: %i(destroy edit update)

  def new
    @comment = @entry.comments.build
  end

  def create
    @comments = Comment.lastest_by_entry @entry
    @comment = @entry.comments.new comment_params
    @comment.user = current_user

    respond_to do |format|
      if @comment.save
        format.js
        format.html {redirect_to entry_path @entry}
      else
        format.html {render "entries/show" }
      end
    end
  end

  def edit
    respond_to :js
  end

  def update
    @comments = Comment.lastest_by_entry @entry
    @comment.update comment_params
    respond_to :js
  end

  def destroy
    @comments = Comment.lastest_by_entry @entry
    @comment.destroy
    respond_to do |format|
      format.html {redirect_to entry_path @entry}
      format.js
    end
  end

  private
  def load_entry
    @entry = Entry.find_by id: params[:entry_id]
    return if @entry
    flash[:notice] = t ".entry_not_found"
    redirect_to @entry
  end

  def load_comment
    @comment = @entry.comments.find_by id: params[:id]
    return if @comment
    flash[:notice] = t ".comment_not_found"
    redirect_to @entry
  end

  def comment_owner
    return if current_user.id == @comment.user_id
    flash[:notice] = "not user"
    redirect_to @entry
  end

  def comment_params
    params.require(:comment).permit Comment::COMMENT_PARAMS
  end
end
