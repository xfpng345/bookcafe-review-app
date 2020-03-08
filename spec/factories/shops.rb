# frozen_string_literal: true

FactoryBot.define do
  factory :shop do
    name { 'hoge' }
    image { 'hoge.png' }
    text { 'hello!' }
    address { '大阪市' }
    area { '大阪キタ' }
    user
    created_at { Faker::Time.between(from: DateTime.now - 2, to: DateTime.now) }
  end
end
