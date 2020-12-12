FactoryBot.define do
  factory :post_food do
    name { 'そば' }
    introduction { 'ダイエットに最適' }
    calorie { 300 }
    protain { 10 }
    fat { 10 }
    carbon { 43 }
  end
end
