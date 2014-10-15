FactoryGirl.define do
  factory :user do
    name Faker::Name.first_name
    email Faker::Internet.email
    password Faker::Internet.password

    factory :user_with_bike do
      after(:create) do |user|
        create(:bike, user:user)
      end
    end
  end
  factory :bike do
    name "Viking"
    description "My fav bike"
    price 200
    picture "temp/pic.png"
    user
  end


end
