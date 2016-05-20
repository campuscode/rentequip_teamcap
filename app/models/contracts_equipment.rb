class ContractsEquipment < ActiveRecord::Base
  self.table_name = :contracts_equipment

  belongs_to :contract
  belongs_to :equipment

  before_create :set_value

  def set_value
    price = Price.where(equipment: equipment, deadline: contract.deadline).first
    self.value = price.value
  end
end
