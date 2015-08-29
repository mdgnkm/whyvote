class Option < ActiveRecord::Base
  belongs_to :question
  has_and_belongs_to_many :parties

  def weight
    unless self.parties.empty?
      return 1/self.parties.length
    end

    return 0
  end
end