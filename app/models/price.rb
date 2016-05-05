class Price < ActiveRecord::Base
  def amount
    price * deadline
  end
end
