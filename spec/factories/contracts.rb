FactoryGirl.define do
  factory :contract do
    customer 'Odebretch'
    started_at '2016-05-02'
    deadline [3,7,15,30]
    finished_at '2016-08-02'
    price '5355.00'
    address 'Alameda Santos, 1293'
    contact 'Ricardo Odebretch'
  end
end
