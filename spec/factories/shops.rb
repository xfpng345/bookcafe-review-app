# frozen_string_literal: true

FactoryBot.define do
  factory :shop do
    name { 'hoge' }
    image { 'hoge.png' }
    text { 'hello!' }
    address { 'osakashi' }
    area { 'osakakita' }
    user
    created_at { Faker::Time.between(from: DateTime.now - 2, to: DateTime.now) }
  end
end
