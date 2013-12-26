class Notification < ActiveRecord::Base
  validates :phone, :presence => true
  belongs_to :list
end
