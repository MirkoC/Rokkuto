class SendAccessEmailJob < ActiveJob::Base
  queue_as :default

  def perform(auth_objects)
    auth_objects.each do |au|
      user = User.find_by_token(au.user_token)
      AccessMailer.send_access_email(user, au).deliver_later
    end
  end
end
