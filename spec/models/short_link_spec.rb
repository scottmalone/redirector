require 'rails_helper'

RSpec.describe ShortLink, type: :model do
  let(:short_link) { create(:short_link) }

  describe "attributes" do
    it {
      should respond_to :user_id
      should respond_to :original_link_id
      should respond_to :short_url_code
      should respond_to :created_at
      should respond_to :updated_at
    }
  end

  describe "associations" do
    it {
      should belong_to :user
      should belong_to :original_link
      should have_many :short_link_visits
    }
  end

  describe "creation" do
    it "creates a new instance given valid attributes" do
      short_link
      expect(ShortLink.count).to eq(1)
    end

    it "sets the short_url_code" do
      expect(short_link.short_url_code).to_not be_nil
    end

    it "increases the counter_cache for the original_link" do
      expect(short_link.original_link.short_links_count).to eq 1
    end
  end
end
