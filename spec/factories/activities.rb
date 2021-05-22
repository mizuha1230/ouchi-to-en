FactoryBot.define do
  factory :activity do
    activity_content {Faker::Lorem.sentence}
    contact {Faker::Lorem.sentence}
    after(:build) do |activity|
      activity.image.attach(io: File.open('public/images/test_image.png'), filename: 'test_image.png')
    end
    association :user
  end
end
