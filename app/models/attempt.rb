class Attempt < ActiveRecord::Base
  belongs_to :survey
  belongs_to :participant, class_name: 'User', foreign_key: 'participant_id'
  has_many :answers, :dependent => :destroy
  accepts_nested_attributes_for :answers,
      :reject_if => ->(q) { q[:question_id].blank? || q[:option_id].blank? }

  def self.accessible_attributes
    [:survey, :survey_id, :participant, :participant_id, :answers_attributes => Answer.accessible_attributes]
  end
end