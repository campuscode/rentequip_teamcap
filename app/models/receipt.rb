class Receipt < ActiveRecord::Base
  belongs_to :contract

  def register_nfe
    # conecta na receita federal e transmite
  end
end
