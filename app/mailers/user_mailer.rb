class UserMailer < ApplicationMailer

  default from: "admin@rassist.com"

  def welcome(user)
    @user = user #@user will be whatever user we pass in to the 'welcome' method
    mail( :to => @user.email, :subject => "Welcome to rAssist!", :cc => "admin@rassist.com" )
  end

  def sendmail(user, from, message)
    @user = user
    @from = from
    @message = message
    mail( :to => @user.email, :subject => "Message from: #{@from.name}" , :cc => @user.email)
  end

end
