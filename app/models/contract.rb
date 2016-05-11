class Contract < ActiveRecord::Base
  has_and_belongs_to_many :equipment
  validates :customer, :started_at, :finished_at, :price, :address,
            :contact, presence: true
end
