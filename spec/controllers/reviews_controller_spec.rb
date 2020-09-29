require "rails_helper"

describe ReviewsController, type: :controller do
  it { is_expected.to use_before_action(:authenticate_user!) }

  let(:user) { create(:user) }
  before { sign_in(user) }

  describe "GET new" do
    it do
      get :new
      expect(response).to have_http_status(:ok)
      expect(assigns(:review)).to be_a_new(Review)
    end
  end
end