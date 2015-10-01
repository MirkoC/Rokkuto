class AccessMailer < ActionMailer::Base
  default from: 'no-reply@noted.in'

  layout 'mailer'

  def send_access_email(user, auth_object)
  end
end
