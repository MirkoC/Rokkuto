class SendAccessEmailJob < ActiveJob::Base
  queue_as :default

  def perform(user, auth_object)
    AccessMailer.send_access_email(user, auth_object).deliver_later
  end
end
