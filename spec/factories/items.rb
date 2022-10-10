FactoryBot.define do
  factory :item do
    merchandise_name          {'商品名'}
    merchandise_explanation   {'商品説明'}
    merchandise_category_id   {2}
    merchandise_condition_id  {2}
    delivery_charge_id        {2}
    area_id                   {2}
    time_to_ship_id           {2}
    merchandise_price         {3000}
    association :user

    after(:build) do |item|
      item.image.attach(io: File.open('public/images/test.png'), filename: 'test.png')
    end
  end
end
