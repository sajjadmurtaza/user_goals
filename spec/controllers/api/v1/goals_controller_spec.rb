# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Api::V1::GoalsController, type: :controller do
  describe '#index' do
    subject(:index) { get :index, params: params }
    let(:user) { create :user, :with_goals }

    before { user }

    let(:params) do
      {
        goal: {
          user_id: user_id
        }
      }
    end

    context 'when valid params' do
      let(:user_id) { user.id }

      it 'returns 200' do
        expect(index).to have_http_status(:ok)
      end

      it 'return array of user goals' do
        expect(JSON.parse(index.body)).not_to be_empty
      end
    end

    context 'when invalid params' do
      let(:user_id) { user.id + 10_000 }

      it 'return no user goals' do
        expect(JSON.parse(index.body)).to be_empty
      end
    end
  end

  describe '#create' do
    subject(:create) { post :create, params: params }

    let(:user) { User.create(name: 'Test', email: 'test@example.example') }

    let(:params) do
      {
        goal: {
          title: 'Learn Golang',
          user_id: user_id,
          start_date: '28-12-2021',
          end_date: '28-02-2022'
        }
      }
    end

    context 'when invalid params' do
      let(:user_id) { 'invalid_user_id' }

      it 'returns error' do
        expect(create.body).to eq 'Please provide correct existing user id.'
      end
    end

    context 'when valid params' do
      let(:user_id) { user.id }

      it 'creates a goal' do
        expect(JSON.parse(create.body)['title']).to eq('Learn Golang')
      end
    end
  end
end
