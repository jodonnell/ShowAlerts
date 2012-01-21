class ShowMailer < ActionMailer::Base
  default from: "noreply@showscomingup.com"

  def email_shows
    matches = UsersShowAlert.find_matches
    matches.group_by(&:user).each do |user, alerts|
      ShowMailer.email_show(user, alerts).deliver
    end
  end

  def email_show(user, alerts)
    @user = user
    @alerts = alerts
    mail(:to => user.email, :subject => "Show Alert")
  end
  
end
