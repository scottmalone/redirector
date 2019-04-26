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

class Report < ApplicationRecord
  extend FriendlyId

  validates :name, presence: true, uniqueness: true

  friendly_id :url
end
