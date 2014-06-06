class UserMailer < ActionMailer::Base
  default from: "folks@parseexperiment.com"

  def welcome_email(user)
    @user = user
    @url = 'http://localhost:3000/sessions/new'
    mail(to: @user.email, subject: 'Testing Mailer for parse-experiment')
  end
end