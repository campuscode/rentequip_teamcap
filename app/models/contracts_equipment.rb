class ContractsEquipment < ActiveRecord::Base
  self.table_name = "contracts_equipment"

  belongs_to :contract
  belongs_to :equipment

  before_save :set_price

  def set_price
    prices = Price.where(deadline: co.contract.deadline, equipment: co.equipment)
    self.value = prices.sum(:value)
  end
end
