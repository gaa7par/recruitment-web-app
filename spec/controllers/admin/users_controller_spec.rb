require 'rails_helper'

RSpec.describe Admin::UsersController, type: :controller do
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
      it 'redirects to root_path' do
        get :index
        expect(response).to redirect_to root_path
      end
    end

    context 'admin logged in' do
      before { sign_in create(:user, :admin) }
      it 'renders index template' do
        get :index
        expect(response).to render_template :index
      end
    end
  end

  describe '#new' do
    context 'user not logged in' do
      it 'redirects to new_user_session_path' do
        get :new
        expect(response).to redirect_to new_user_session_path
      end
    end

    context 'user logged in' do
      before { sign_in create(:user) }
      it 'redirects to root_path' do
        get :new
        expect(response).to redirect_to root_path
      end
    end

    context 'admin logged in' do
      before { sign_in create(:user, :admin) }
      it 'renders new template' do
        get :new
        expect(response).to render_template :new
      end
    end
  end

  describe '#create' do
    context 'when params are valid' do
      it 'creates a new user' do
        admin = create(:user, :admin)

        sign_in admin

        post :create, params: {
          user: {
            email: 'user@app.com',
            gender: 'genderqueer',
            age: 20,
            points_of_interests_attributes: [
              name: 'My Points',
              type_of_points: 'hobby',
              points: 100
            ]
          }
        }

        expect(response).to redirect_to admin_users_path

        user = User.last
        points = PointsOfInterest.last
        expect(user.email).to eq 'user@app.com'
        expect(user.gender).to eq 'genderqueer'
        expect(user.age).to eq 20

        expect(points.name).to eq 'My Points'
        expect(points.type_of_points).to eq 'hobby'
        expect(points.points).to eq 100
      end
    end

    context 'when params are invalid' do
      it 'renders errors' do
        admin = create(:user, :admin)

        sign_in admin

        post :create, params: { user: { email: '' } }

        expect(response).to render_template :new
      end
    end
  end
end
