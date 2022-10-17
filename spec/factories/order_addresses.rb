FactoryBot.define do
  factory :order_address do
    receiving_postal_code {'123-4567'}
    area_id {11}
    receiving_municipalities {'葛飾区'}
    receiving_house_number {'亀有1-1'}
    receiving_building_name {'サイレントヒル'}
    phone_number {'08012345678'}
    token {"tok_abcdefghijk00000000000000000"}
  end

end
