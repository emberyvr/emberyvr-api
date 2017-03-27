class UserMailer < ActionMailer::Base
  include Roadie::Rails::Automatic
  default from: Rails.application.config.mail_from
  helper ApplicationHelper
  layout 'mailer'

  def sign_up(user)
    @user = user
    mail to: @user.email, subject: "Thanks for signing up"
  end

  def reset_password(user)
    @user = user
    mail to: @user.email, subject: "Reset password request"
  end

  def notify_reset_password(user)
    @user = user
    mail to: @user.email, subject: "Your password has been reset"
  end

  def change_email(user, old_email)
    @user = user
    @old_email = old_email
    mail to: old_email, subject: "Your Email has been changed"
    mail to: @user.email, subject: "Your Email has been changed"
  end
end
