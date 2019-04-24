class OriginalLink < ApplicationRecord
  has_many :short_links

  validates :original_url, presence: true
end
