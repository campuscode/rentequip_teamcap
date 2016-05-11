class Price < ActiveRecord::Base
  belongs_to :equipment

  validates :equipment, :value, :deadline, presence: true
end
