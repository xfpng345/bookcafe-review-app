FactoryBot.define do

  factory :user do
    username              {"abe"}
    password              {"00000000"}
    password_confirmation {"00000000"}
    image                 {""}
    sequence(:email) {Faker::Internet.email}
  end

end