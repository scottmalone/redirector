module ShortLinks
  class VisitShortLink < ActiveInteraction::Base
    string :short_url_code

    validates :short_url_code, presence: true

    def execute
      short_link = ShortLink.find_by(short_url_code: short_url_code)
      # VisitShortLinkWorker
      short_link.original_link.original_url
    end
  end
end
