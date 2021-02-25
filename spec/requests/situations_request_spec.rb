require 'rails_helper'

RSpec.describe "Situations", type: :request do

  describe "GET /index" do
    it "returns http success" do
      get "/situations/index"
      expect(response).to have_http_status(:success)
    end
  end

end
