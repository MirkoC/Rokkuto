class Application < ActiveRecord::Base
  has_many :auth_objects
  validates :name, presence: true
end
