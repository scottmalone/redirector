# == Schema Information
#
# Table name: reports
#
#  id         :bigint(8)        not null, primary key
#  name       :string           not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
# Indexes
#
#  index_reports_on_name  (name) UNIQUE
#

FactoryBot.define do
  factory :report do
    name { Faker::Name.unique.name }
    url { Faker::Name.unique.name.parameterize }
  end
end
