# == Schema Information
#
# Table name: short_link_visits
#
#  id            :bigint(8)        not null, primary key
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#  short_link_id :bigint(8)
#
# Indexes
#
#  index_short_link_visits_on_short_link_id  (short_link_id)
#
# Foreign Keys
#
#  fk_rails_...  (short_link_id => short_links.id)
#

FactoryBot.define do
  factory :short_link_visit do
    short_link
  end
end
