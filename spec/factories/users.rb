FactoryBot.define do
  factory :user do
  
    nickname {'furima太朗'}
    email {Faker::Internet.free_email}
    password {'furima0121'}
    password_confirmation {password}
    family_name {'山田'}
    first_name {'陸太郎'}
    family_name_kana {'ヤマタ'}
    first_name_kana {'リクタロウ'}
    birth_day {'1932-06-08'}
  end
end
