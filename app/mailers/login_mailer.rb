class LoginMailer < ApplicationMailer

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.login_mailer.mailer.subject
  #
  def login_link(user)
    @user = user
    mail to: @user.email, subject: "Welcome"
  end
  def mailer
    @greeting = "Hi"

    mail to: "to@example.org"
  end
end
