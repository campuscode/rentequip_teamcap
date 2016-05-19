class Contract < ActiveRecord::Base
  has_one :delivery_receipt
  has_one :return_receipt

  has_many :contracts_equipment
  has_many :equipment, through: :contracts_equipment

  validates :customer, :started_at, :address,
            :contact, presence: true

<<<<<<< HEAD
  DEADLINE = [3, 7, 15, 30].freeze
  before_save :calculate_contract_end
=======
  DEADLINE = [3,7,15,30]

  before_save :calculate_contract_end
  after_save :set_price
>>>>>>> Calculate value of the contract

  protected

  def calculate_contract_end
<<<<<<< HEAD
    self.finished_at = started_at + deadline.days
=======
    self.finished_at = self.started_at + self.deadline.days
  end

  def set_price
    self.price = ContractsEquipment.where(contract: self, equipment: self.equipment).first.value
>>>>>>> Calculate value of the contract
  end
end
