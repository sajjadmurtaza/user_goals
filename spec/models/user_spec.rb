# frozen_string_literal: true

require 'rails_helper'

RSpec.describe User, type: :model do
  let(:user) { create :user }

  it 'has a valid factory' do
    expect(user).to be_valid
  end

  it { is_expected.to be_a(User) }
end
