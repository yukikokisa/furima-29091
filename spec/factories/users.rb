FactoryBot.define do
  factory :user do
    nickname               { Faker::Name.initials(number: 2) }
    email                  { Faker::Internet.free_email }
    password               { Faker::Internet.password(min_length: 6) }
    password_confirmation  { password }
    last_name              { '佐々木' }
    fast_name              { '花子' }
    last_name_kana         { 'ササキ' }
    fast_name_kana         { 'ハナコ' }
    birth_date             { '2000-01-01' }
  end
end
