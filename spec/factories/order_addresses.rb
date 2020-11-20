FactoryBot.define do
  factory :order_address do
    token {'tok_abcdefghijk00000000000000000'}
    postal_code  { '111-1111' }
    prefecture_id { 1 }
    city  { '東京都' }
    house_number  { '1-1' }
    building_name { '東京ハイツ' }
    phone_number { '09012345678' }
    user_id { 1 }
    item_id { 1 }
  end
end
