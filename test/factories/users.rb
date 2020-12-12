FactoryBot.define do
  factory :user do
    last_name { '田中' }
    first_name { '太郎' }
    email { 'hoge@test' }
    password { 'testtest' }
  end
  factory :another_user do
    last_name { '山田' }
    first_name { '花子' }
    email { 'another@user' }
    password { 'anotheruser' }
  end
end
