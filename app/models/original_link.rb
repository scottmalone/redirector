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

class OriginalLink < ApplicationRecord
  has_many :short_links

  validates :original_url, presence: true

  def self.popularity_rankings
    short_link_visits_counts = ShortLinkVisit.group(:short_link_id).order("count_all desc").limit(100).count
    # e.g. {2=>3, 3=>2, 1=>1}

    short_link_ids = short_link_visits_counts.keys

    short_links = ShortLink.where(id: short_link_ids).includes(:original_link)

    website_counts = short_links.reduce([]) do |acc, short_link|
      acc << {
        original_url: short_link.original_link.original_url,
        count: short_link_visits_counts[short_link.id]
      }
    end

    website_counts.sort_by { |element| element[:count] }.reverse
  end
end
