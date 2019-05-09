class NotifierMailer < ApplicationMailer
  def warning_user(user)
    @user = user
    mail :to => @user.email, :subject => "Warning: Your account was deleted!"
  end

  def warning_entry(entry)
    @entry = entry
    mail :to => @entry.user.email, :subject => "warning: Your entry was deleted!"
  end
end
