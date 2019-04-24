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
