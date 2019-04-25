require 'rails_helper'

describe ShortLinks::VisitShortLink do
  let(:original_link) { create(:original_link) }
  let(:short_link) { create(:short_link, original_link: original_link) }

  it 'returns the original url' do
    outcome = described_class.run(short_url_code: short_link.short_url_code)
    expect(outcome.result).to eq original_link.original_url
  end
end
