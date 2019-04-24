# == Schema Information
#
# Table name: short_links
#
#  id               :bigint(8)        not null, primary key
#  short_url_code   :string           not null
#  created_at       :datetime         not null
#  updated_at       :datetime         not null
#  original_link_id :bigint(8)        not null
#  user_id          :bigint(8)        not null
#
# Indexes
#
#  index_short_links_on_original_link_id  (original_link_id)
#  index_short_links_on_short_url_code    (short_url_code) UNIQUE
#  index_short_links_on_user_id           (user_id)
#

FactoryBot.define do
  factory :short_link do
    user
    original_link
  end
end
