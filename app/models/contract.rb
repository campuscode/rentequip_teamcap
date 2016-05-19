class Contract < ActiveRecord::Base
  has_one :delivery_receipt
  has_one :return_receipt

  has_and_belongs_to_many :equipment
  validates :customer, :started_at, :price, :address,
            :contact, presence: true

  DEADLINE = [3, 7, 15, 30].freeze
  before_save :calculate_contract_end

  protected

  def calculate_contract_end
    self.finished_at = started_at + deadline.days
  end
end
