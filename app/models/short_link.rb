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

class ShortLink < ApplicationRecord
  belongs_to :user
  belongs_to :original_link, counter_cache: true
  has_many :short_link_visits

  before_create :create_short_url_code

  private

    def create_short_url_code
      self.short_url_code = unique_code
    end

    def unique_code
      loop do
        code = SecureRandom.alphanumeric(50).downcase
        break code unless ShortLink.where(short_url_code: code).exists?
      end
    end
end
