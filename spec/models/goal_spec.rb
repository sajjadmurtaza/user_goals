# == Schema Information
#
# Table name: goals
#
#  id         :integer          not null, primary key
#  user_id    :integer
#  title      :string
#  start_date :date
#  end_date   :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Goal, type: :model do
  let(:goal) { create :goal }
  let(:user) { create :user, :with_goals }

  it 'has a valid factory' do
    expect(goal).to be_valid
  end

  it { is_expected.to be_a(Goal) }

  describe '#by_user' do
    subject { Goal.by_user(user.id) }

    before { user }

    it 'return user goals with user id' do
      expect(subject.pluck(:id)).to eq user.goals.pluck(:id)
    end
  end
end
