class Admin::CommentsController < Admin::BasesController
  def index
    @comments = Comment.by_lastest.page(params[:page]).includes(:user, :entry).per Settings.per_page
  end

  def destroy
    @comment = Comment.find_by id: params[:id]
    if @comment.destroy
      flash[:success] = t ".deleted"
      redirect_to request.referer
    else
      flash[:error] = t ".delete_fail"
      redirect_to admin_comments_url
    end
  end
end
