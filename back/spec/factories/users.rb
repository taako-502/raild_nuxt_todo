# frozen_string_literal: true

# spec/factories/users.rb
FactoryBot.define do
  factory :user do
    name { Faker::Alphanumeric.alphanumeric(number: 10) }
    # 他の属性も必要に応じて追加してください
  end
end
