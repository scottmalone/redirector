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
end
