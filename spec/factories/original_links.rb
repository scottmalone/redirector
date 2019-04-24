FactoryBot.define do
  factory :original_link do
    original_url { Faker::Internet.url }
  end
end
