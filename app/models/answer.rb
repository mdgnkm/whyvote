class Answer < ActiveRecord::Base
  belongs_to :attempt
  belongs_to :option
  belongs_to :question

  validates :option_id, :question_id, :presence => true
  validates :option_id, :uniqueness => { :scope => [:attempt_id, :question_id] }

  def self.accessible_attributes
    [:attempt, :option, :option_id, :question, :question_id]
  end
end