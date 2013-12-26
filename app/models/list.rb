class List < ActiveRecord::Base
  has_many :chores, :dependent => :destroy
  has_many :penalties, :dependent => :destroy
  has_one :password, :dependent => :destroy
  has_many :notifications, :dependent => :destroy
end
