require 'rails_helper'

RSpec.describe User, type: :model do
  let(:user) { create(:user) }

  describe "attributes" do
    it {
      should respond_to :email
      should respond_to :updated_at
      should respond_to :created_at
    }
  end

  describe "validations" do
    it {
      should validate_presence_of :email
    }
  end

  it "creates a new instance given valid attributes" do
    user = create(:user)
    expect(User.count).to eq(1)
  end
end
