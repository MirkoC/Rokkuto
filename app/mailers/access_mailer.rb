class AccessMailer < ActionMailer::Base
  default from: 'no-reply@notedin.com'

  layout 'mailer'

  def send_access_email(user, auth_object)
    @user = user
    @link = "example.com/#{auth_object.token}"
    mail(to: @user.email,
         subject: 'You have been served new item',
         content_type: 'text/html')
  end
end
