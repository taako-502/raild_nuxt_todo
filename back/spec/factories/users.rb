# spec/factories/users.rb
FactoryBot.define do
  factory :user do
    name { Faker::Name.name }
    # 他の属性も必要に応じて追加してください
  end
end
