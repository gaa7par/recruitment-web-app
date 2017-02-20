require 'rails_helper'

RSpec.describe AdminsController, type: :controller do
  render_views

  describe '#show' do
    context 'user not logged in' do
      it 'redirects to new_user_session_path' do
        get :show
        expect(response).to redirect_to new_user_session_path
      end
    end

    context 'user logged in' do
      before { sign_in create(:user) }
      it 'renders show template' do
        get :show
        expect(response).to redirect_to root_path
      end
    end

    context 'admin logged in' do
      before { sign_in create(:user, :admin) }
      it 'renders show template' do
        get :show
        expect(response).to render_template :show
      end
    end
  end
end
