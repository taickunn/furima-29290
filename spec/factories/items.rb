FactoryBot.define do
  factory :item do
  
    name {'kangol'}
    description {'kangolのパーカーです'}
    category_id {'2'}
    condition_id {'2'}
    postage_id {'2'}
    prefecture_id {'2'}
    shipping_day_id {'2'}
    price {'5000'}
    association :user
  end
end
