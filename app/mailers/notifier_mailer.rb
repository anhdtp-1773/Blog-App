class NotifierMailer < ApplicationMailer
  def warning_user(user)
    @user = user
    mail :to => @user.email, :subject => t(".warning_account")
  end

  def warning_entry(entry)
    @entry = entry
    mail :to => @entry.user.email, :subject => t(".warning_entry")
  end

  def follow_user(user, current_user)
    @user = user
    @current_user = current_user
    mail :to => @user.email, :subject => t(".notify_follow") + "#{@current_user.nick_name}"
  end
end
