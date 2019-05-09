class StaticPagesController < ApplicationController
  def home
    @entry = Entry.by_lastest.limit Settings.limit_post_home
    @entries = Entry.all_entries.page(params[:page]).per Settings.per_page
  end

  def about_us; end

  def contact; end
end
