class Survey < ActiveRecord::Base
  has_many :questions, :dependent => :destroy
  has_many :attempts, :dependent => :destroy
  accepts_nested_attributes_for :questions,
    :reject_if => ->(a) { a[:text].blank? },
    :allow_destroy => true
end