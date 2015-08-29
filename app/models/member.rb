class Member < ActiveRecord::Base
  belongs_to :team
  belongs_to :user
  validates_presence_of :user, :team
end
