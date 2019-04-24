# == Schema Information
#
# Table name: original_links
#
#  id                :bigint(8)        not null, primary key
#  original_url      :string           not null
#  short_links_count :integer
#  created_at        :datetime         not null
#  updated_at        :datetime         not null
#
# Indexes
#
#  index_original_links_on_original_url  (original_url) UNIQUE
#

FactoryBot.define do
  factory :original_link do
    original_url { Faker::Internet.url }
  end
end
