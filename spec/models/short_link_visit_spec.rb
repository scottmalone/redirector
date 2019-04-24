require 'rails_helper'

RSpec.describe ShortLinkVisit, type: :model do
  let(:short_link_visit) { create(:short_link_visit) }

  describe "attributes" do
    it {
      should respond_to :created_at
      should respond_to :updated_at
    }
  end

  describe "associations" do
    it {
      should belong_to :short_link
    }
  end

  describe "creation" do
    it "creates a new instance given valid attributes" do
      short_link_visit
      expect(ShortLinkVisit.count).to eq(1)
    end
  end
end
