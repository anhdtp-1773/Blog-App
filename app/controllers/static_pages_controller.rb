class StaticPagesController < ApplicationController
  def home
    # @entry = Entry.most_likes.limit Settings.limit_post_home
    # @entries = Entry.all_posts.page(params[:page]).per Settings.per_page
  end

  def about_us; end

  def contact; end
end
