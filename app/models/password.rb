class Password < ActiveRecord::Base
  validates :password, :presence => true
  belongs_to :list
end
