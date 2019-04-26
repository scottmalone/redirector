require 'rails_helper'

RSpec.describe OriginalLink, type: :model do
  let(:original_link) { create(:original_link) }

  describe "attributes" do
    it {
      should respond_to :original_url
      should respond_to :short_links_count
      should respond_to :created_at
      should respond_to :updated_at
    }
  end

  describe "associations" do
    it {
      should have_many :short_links
    }
  end

  describe "validations" do
    it {
      should validate_presence_of :original_url
    }
  end

  it "creates a new instance given valid attributes" do
    original_link
    expect(OriginalLink.count).to eq(1)
  end

  describe "scope #ranked_by_popularity" do
    let(:first_place) { 'www.first-place.com' }
    let(:second_place) { 'www.second-place.com' }
    let(:third_place) { 'www.third-place.com' }

    let(:original_link1) { create(:original_link, original_url: 'www.third-place.com') }
    let(:original_link2) { create(:original_link, original_url: 'www.first-place.com') }
    let(:original_link3) { create(:original_link, original_url: 'www.second-place.com') }

    let(:short_link1) { create(:short_link, original_link: original_link1) }
    let(:short_link2) { create(:short_link, original_link: original_link2) }
    let(:short_link3) { create(:short_link, original_link: original_link3) }

    # One visit so that it comes in third place
    let!(:short_link_visit1) { create(:short_link_visit, short_link: short_link1) }

    # Three visits so that it comes in first place
    let!(:short_link_visit2) { create(:short_link_visit, short_link: short_link2) }
    let!(:short_link_visit3) { create(:short_link_visit, short_link: short_link2) }
    let!(:short_link_visit4) { create(:short_link_visit, short_link: short_link2) }

    # Two visits so that it comes in second place
    let!(:short_link_visit5) { create(:short_link_visit, short_link: short_link3) }
    let!(:short_link_visit6) { create(:short_link_visit, short_link: short_link3) }

    it "returns the original_urls ranked in descending popularity" do
      expect(OriginalLink.popularity_rankings.first[:original_url]).to eq first_place
      expect(OriginalLink.popularity_rankings.second[:original_url]).to eq second_place
      expect(OriginalLink.popularity_rankings.third[:original_url]).to eq third_place
    end
  end
end
