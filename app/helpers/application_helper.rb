module ApplicationHelper
  def resource_name
    :user
  end

  def self.resource
    @resource ||= User.new
  end

  def resource_class
    User
  end

  def devise_mapping
    @devise_mapping ||= Devise.mappings[:user]
  end

  def show_status
    Entry.statuses.keys
  end

  def full_title page_title = ""
    base_title = "Blog App"
    if page_title.empty?
      base_title
    else
      page_title + " | " + base_title
    end
  end

  def create_index params_page, index, per_page
    params_page = 1 if params_page.nil?
    (params_page.to_i - 1) * per_page.to_i + index.to_i + 1
  end
end
