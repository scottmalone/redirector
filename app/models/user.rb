class User < ApplicationRecord
  has_many :short_links

  validates :email, presence: true
end
