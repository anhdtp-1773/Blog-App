class Admin::EntriesController < Admin::BasesController
  before_action :verify_admin!, only: %i(create index destroy)
  before_action :load_entry, only: %i(edit update destroy)

  def index
    @entries = Entry.by_lastest.page(params[:page]).per Settings.per_page
  end

  def new
    @entry = Entry.new
  end

  def create
    @entry = Entry.new entry_params
    if @entry.save
      flash[:success] = t(".created_success")
      redirect_to admin_entries_path
    else
      flash[:error] = t(".create_unsuccess")
      render :new
    end
  end

  def edit; end

  def update
    if @entry.update entry_params
      flash[:success] = t(".entry_updated")
      redirect_to admin_entries_path
    else
      render :edit
    end
  end

  def destroy
    if @entry.destroy
      NotifierMailer.warning_entry(@entry).deliver
      flash[:success] = t(".entry_deleted")
      redirect_to admin_entries_path
    else
      flash[:error] = t(".delete_failed")
      redirect_to admin_entries_path
    end
  end

  private

  def entry_params
    params.require(:entry).permit Entry::ENTRY_PARAMS
  end

  def load_entry
    @entry = Entry.find_by id: params[:id]
    return if @entry
    flash[:error] = t(".entry_not_found")
    redirect_to admin_entries_path
  end
end
