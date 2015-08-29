class Question < ActiveRecord::Base
  belongs_to :survey
  has_many :options, :dependent => :destroy
  accepts_nested_attributes_for :options,
      :reject_if => ->(a) { a[:text].blank? },
      :allow_destroy => true

  enum format: [ :selection, :rank ]

  def format_enum
    self.class.formats.to_a
  end

  def format= value
    if value.kind_of?(String) and value.to_i.to_s == value
      super value.to_i
    else
      super value
    end
  end
end