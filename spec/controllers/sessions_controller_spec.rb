require 'rails_helper'

RSpec.describe SessionsController, type: :controller do

  describe "GET #new" do
    it "returns http success" do
      get :new
      expect(response).to have_http_status(:success)
    end
  end

  describe "post create" do
    context "sign in when already create user" do
      let(:user){ create(:user, email: "test@gmail.com" , password: "test") }
      let(:session_params) { { session: { email: user.email, password: user.password } } }

      subject { post :create, params: session_params }

      it "has session_id" do
        expect { subject }.to change{ session[:user_id] }.from(nil).to(user.id)
      end
      it { is_expected.to redirect_to posts_index_path }
    end

    context "when not create user" do
      let(:user){ create(:user, email: "test@gmail.com" , password: "test") }
      let(:session_params) { { session: { email: "error@gmail.com", password: user.password } } }
      subject { post :create, params: session_params }

      it "has not change session_id" do
        expect { subject }.to_not change{ session[:user_id] }.from(nil)
      end

      it "render new" do
        expect(subject).to render_template :new
      end
    end
  end
end
