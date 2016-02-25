class UserMailer < ApplicationMailer
  default :from => "sam@thedanebook.com"

  def welcome(user)
    @user = user
    mail(to: @user.email, subject: 'Welcome to The Danebook!')
  end

end
