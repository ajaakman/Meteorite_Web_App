require 'rails_helper'

RSpec.describe CartController, type: :controller do

  describe "GET #cart" do
    it "returns http success" do
      get :cart
      expect(response).to have_http_status(:success)
    end
  end

end
