# frozen_string_literal: true

FactoryBot.define do
  factory :comment do
    text { 'hello' }
    user
    shop
  end
end
