require 'rails_helper'

describe ShortLinks::CreateShortLink do
  let(:email) { Faker::Internet.email }
  let(:original_url) { Faker::Internet.url }

  it 'returns a ShortLink' do
    outcome = described_class.run(email: email, original_url: original_url)
    expect(outcome.result).to be_a ShortLink
  end

  context 'when a user already exists for the provided email' do
    let(:user) { create(:user) }

    it 'returns a ShortLink that belongs to that user' do
      outcome = described_class.run(email: user.email, original_url: original_url)
      expect(outcome.result.user).to eq user
    end
  end

  context 'when a user does not exist for the provided email' do
    it 'returns a ShortLink that belongs to a new user' do
      outcome = described_class.run(email: email, original_url: original_url)
      expect(outcome.result.user.email).to eq email
      expect(User.count).to eq 1
    end
  end

  context 'when the provided original_url already exists' do
    let(:original_link) { create(:original_link) }

    it 'creates a ShortLink that belongs to the existing original_url' do
      outcome = described_class.run(email: email, original_url: original_link.original_url)
      expect(outcome.result.original_link).to eq original_link
    end
  end

  context 'when the provided original_url does not already exist' do
    it 'creates a ShortLink that belongs to a new original_url' do
      outcome = described_class.run(email: email, original_url: original_url)
      expect(outcome.result.original_link).to eq OriginalLink.first
      expect(OriginalLink.count).to eq 1
    end
  end
end
