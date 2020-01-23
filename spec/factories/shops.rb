FactoryBot.define do
  factory :shop do
    name {"hoge"}
    image {"hoge.png"}
    text {"hello!"}
    address{""}
    area{""}
    user
    created_at { Faker::Time.between(from: DateTime.now - 2, to: DateTime.now) }
  end
end