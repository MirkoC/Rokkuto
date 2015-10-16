class SendAccessEmailJob < ActiveJob::Base
  queue_as :default

  def perform(auth_objects)
    auth_objects.each do |au|
      user = User.find_by_token(au.user_token)
      application = Application.find_by_id(au.application_id)
      AccessMailer.send_access_email(user, au, application.domain).deliver
    end
  end
end
