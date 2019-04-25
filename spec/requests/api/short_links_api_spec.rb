require 'rails_helper'

RSpec.describe "Short Links API", type: :request do
  describe "POST /api/short-links" do
    let(:email) { Faker::Internet.email }
    let(:original_url) { Faker::Internet.url }
    let(:post_params) do
      {
        short_link: {
          email: email,
          original_url: original_url
        }
      }
    end

    it "should get a successful (200) response" do
      post "/api/short-links", params: post_params
      expect(response).to have_http_status(:ok)
    end

    it "responds with json by default" do
      post "/api/short-links", params: post_params
      expect(response.content_type).to eq "application/vnd.api+json"
    end

    it "creates one record" do
      post "/api/short-links", params: post_params
      expect(ShortLink.count).to eq 1
    end

    it "has the POSTed attributes in the response body" do
      post "/api/short-links", params: post_params
      resp_attrs = json["data"]["attributes"]
      expect(resp_attrs["email"]).to eq post_params[:short_link][:email]
      expect(resp_attrs["short_url"]).to_not be_nil
      expect(resp_attrs["original_url"]).to eq post_params[:short_link][:original_url]
    end
  end
end
