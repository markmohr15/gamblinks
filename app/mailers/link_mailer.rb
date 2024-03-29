class LinkMailer < ActionMailer::Base
  default from: "mail@coollinks.com"

  def link_notification(link)
    @link = link
    @user = @link.user
    emails = @user.followers.where(email_notification: "Yes").map { |follower| follower.email }
    if emails.count > 0
      mail(bcc: emails, subject: 'Someone you follow submitted a new link!')
    end
  end
end
