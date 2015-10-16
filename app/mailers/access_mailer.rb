class AccessMailer < ActionMailer::Base
  default from: 'no-reply@noted.in'

  layout 'mailer'

  def send_access_email(user, auth_object, domain)
    @user = user
    @link = "#{domain}/#{auth_object.token}"
    mail(to: @user.email,
         subject: 'You have been served new item',
         content_type: 'text/html')
  end
end
