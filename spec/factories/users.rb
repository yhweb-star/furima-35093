FactoryBot.define do
  factory :user do
    nickname {Faker::Name.last_name}
    email {Faker::Internet.free_email}
    password = Faker::Internet.password(min_length: 6)
    password {password}
    password_confirmation {password}
    first_name {Faker::Name.first_name}
    last_name {Faker::Name.last_name}
    first_name_kana {Faker::Name.first_katakana}
    last_name_kanae {Faker::Name.last_katakana}
    birth {Faker::Date.backward}
  end
end