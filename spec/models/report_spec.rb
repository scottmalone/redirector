require 'rails_helper'

RSpec.describe Report, type: :model do
  let(:report) { create(:report) }

  describe "attributes" do
    it {
      should respond_to :name
      should respond_to :created_at
      should respond_to :updated_at
    }
  end

  describe "creation" do
    it "creates a new instance given valid attributes" do
      report
      expect(Report.count).to eq(1)
    end
  end
end
