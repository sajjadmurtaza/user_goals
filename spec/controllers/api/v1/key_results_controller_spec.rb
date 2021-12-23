# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Api::V1::KeyResultsController, type: :controller do
  describe '#create' do
    subject(:create) { post :create, params: params }

    let(:params) do
      {
        key_result: {
          title: 'Pause',
          goal_id: goal_id
        }
      }
    end

    context 'with invalid params' do
      let(:goal_id) { 'invalid_goal_id' }

      it 'returns error' do
        expect(JSON.parse(create.body)).to eq ['Goal must exist']
      end
    end
  end
end
