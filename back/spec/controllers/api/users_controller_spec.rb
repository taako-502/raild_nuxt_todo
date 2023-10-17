# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Api::UsersController, type: :controller do # rubocop:disable Metrics/BlockLength
  let(:user) { create(:user) }

  describe 'GET #index' do
    before do
      get :index
    end

    it 'returns a successful response' do
      expect(response).to be_successful
    end

    it 'returns all users' do
      json_response = JSON.parse(response.body)
      expect(json_response.length).to eq(User.count)
    end
  end

  describe 'GET #show' do
    before do
      get :show, params: { id: user.id }
    end

    it 'returns a successful response' do
      expect(response).to be_successful
    end

    it 'returns the user' do
      json_response = JSON.parse(response.body)
      expect(json_response['id']).to eq(user.id)
    end
  end

  describe 'POST #create' do
    context 'with valid attributes' do
      let(:valid_attributes) { { name: Faker::Alphanumeric.alphanumeric(number: 10) } }
      let(:user) {}

      it 'creates a new user' do
        expect do
          post :create, params: { user: valid_attributes }
        end.to change(User, :count).by(1)
      end
    end

    context 'with invalid attributes' do
      let(:invalid_attributes) { { name: nil } }

      it 'does not create a new user' do
        expect do
          post :create, params: { user: invalid_attributes }
        end.to change(User, :count).by(0)
      end
    end
  end

  describe 'PATCH #update' do
    let(:new_name) { Faker::Alphanumeric.alphanumeric(number: 10) }

    before do
      patch :update, params: { id: user.id, user: { name: new_name } }
    end

    it 'updates the user' do
      user.reload
      expect(user.name).to eq(new_name)
    end
  end

  describe 'DELETE #destroy' do
    it 'deletes the user' do
      user_to_delete = create(:user)
      expect do
        delete :destroy, params: { id: user_to_delete.id }
      end.to change(User, :count).by(-1)
    end
  end
end
