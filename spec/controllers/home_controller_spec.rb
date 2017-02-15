require 'rails_helper'

RSpec.describe HomeController, type: :controller do
  render_views

  describe '#index' do
    context 'user not logged in' do
      it 'redirects to new_user_session_path' do
        get :index
        expect(response).to redirect_to new_user_session_path
      end
    end

    context 'user logged in' do
      before { sign_in create(:user) }
      it 'renders index template' do
        get :index
        expect(response).to render_template :index
      end
    end
  end

  describe '#destroy' do
    context 'user is not an admin' do
      let(:user) { create(:user) }
      let(:call_request) { delete :destroy, params: { id: user.id } }

      before { sign_in user }
      it { expect { call_request }.not_to change { User.count } }
    end

    context 'user is an admin' do
      let(:admin) { create(:user, :admin) }
      let!(:user) { create(:user) }
      let(:call_request) { delete :destroy, params: { id: user.id } }

      before { sign_in admin }
      it { expect { call_request }.to change { User.count }.by -1 }
    end
  end
end
