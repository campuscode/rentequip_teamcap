class Contract < ActiveRecord::Base
  has_one :delivery_receipt
  has_one :return_receipt

  has_many :contracts_equipment
  has_many :equipment, through: :contracts_equipment

  validates :customer, :started_at, :address,
            :contact, presence: true

  DEADLINE = [3, 7, 15, 30].freeze
  before_save :calculate_contract_end
  after_create :set_price

  protected

  def calculate_contract_end
    self.finished_at = started_at + deadline.days
  end

  def set_price
    price = contracts_equipment.sum(:value)
    self.update_attribute(:price, price)
  end
end
