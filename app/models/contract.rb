class Contract < ActiveRecord::Base
  has_one :delivery_receipt, -> { where(goal: 'delivery') }, class_name: 'Receipt'

  has_and_belongs_to_many :equipment
  validates :customer, :started_at, :finished_at, :price, :address,
            :contact, presence: true
end
