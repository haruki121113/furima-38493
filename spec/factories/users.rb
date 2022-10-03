FactoryBot.define do
  factory :user do
    nick_name              {Faker::Name.initials(number: 2)}
    email                 {Faker::Internet.free_email}
    password              {'abc0000'}
    password_confirmation {password}
    main_family_name      {'佐藤'}
    main_first_name       {'太郎'}
    main_family_name_kana {'サトウ'}
    main_first_name_kana  {'タロウ'}
    birth_day             {20001113}
  end
end