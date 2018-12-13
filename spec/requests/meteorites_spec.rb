require 'rails_helper'

RSpec.describe "Meteorites", type: :request do
  describe "GET /meteorites" do
    it "works! (now write some real specs)" do
      get meteorites_path
      expect(response).to have_http_status(200)
    end
  end
end
