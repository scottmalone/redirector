module ShortLinks
  class CreateShortLink < ActiveInteraction::Base
    string :email
    string :original_url

    validates :email, presence: true
    validates :original_url, presence: true

    def execute
      user = User.where(email: email).first_or_create
      original_link = OriginalLink.where(original_url: original_url).first_or_create
      ShortLink.create(user: user, original_link: original_link)
    end
  end
end
