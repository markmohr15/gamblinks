class LinkMailer < ActionMailer::Base
  default from: "mail@omahasweethearts.com"

  def link_notification(link)
    @link = link
    @user = @link.user
    emails = @user.followers.map { |follower| follower.email }
    mail(to: emails, subject: 'Someone you follow submitted a new link!')
  end
end
