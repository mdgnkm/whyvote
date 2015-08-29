class Team < ActiveRecord::Base
  has_many :members, dependent: :destroy
  has_many :users, -> { uniq }, through: :members
  has_one :captain_member, -> { where captain: true }, class_name: 'Member'
  has_one :captain, through: :captain_member, source: :user


end
