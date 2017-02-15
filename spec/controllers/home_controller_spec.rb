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
end
