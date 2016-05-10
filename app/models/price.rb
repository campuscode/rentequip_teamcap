class Price < ActiveRecord::Base
  belongs_to :equipment

  def amount
    value * deadline
  end
end
