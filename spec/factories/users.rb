FactoryBot.define do

  factory :user do
    password = Faker::Internet.password(min_length: 8)
    username {Faker::Name.last_name}
    password {password}
    password_confirmation {password}
    image                 {""}
    email {Faker::Internet.free_email}
  end

end