class EntriesController < ApplicationController
  before_action :load_entry, only: %i(edit update destroy show)
  before_action :load_user, only: :show

  def index
    @entries = Entry.by_lastest.user_entries(current_user).page(params[:page]).per Settings.per_page
  end

  def new
    @entry = Entry.new
  end

  def create
    @entry = Entry.new entry_params
    if @entry.save
      flash[:success] = t(".created_success")
      redirect_to user_entries_path(current_user)
    else
      flash[:error] = t(".create_unsuccess")
      render :new
    end
  end

  def edit; end

  def update
    if @entry.update entry_params
      flash[:success] = t(".entry_updated")
      redirect_to user_entries_path(current_user)
    else
      render :edit
    end
  end

  def destroy
    if @entry.destroy
      flash[:success] = t(".entry_deleted")
      redirect_to user_entries_path(current_user)
    else
      flash[:error] = t(".delete_failed")
      redirect_to user_entries_path(current_user)
    end
  end

  def show
    @other_entries = Entry.other_entries(@entry).page(params[:page]).per Settings.limit_post_home
    @comments = @entry.comments.includes(:user).order(created_at: :desc)
    @comment = Comment.new
  end

  private

  def load_user
    @user = User.find_by id: params[:id]
    return if @user
    flash[:error] = t(".user_not_found")
    redirect_to root_path
  end

  def entry_params
    params.require(:entry).permit Entry::ENTRY_PARAMS
  end

  def load_entry
    @entry = Entry.find_by id: params[:id]
    return if @entry
    flash[:error] = t(".entry_not_found")
    redirect_to user_entries_path
  end
end
