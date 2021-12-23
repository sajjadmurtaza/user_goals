# frozen_string_literal: true

require 'rails_helper'

RSpec.describe KeyResult, type: :model do
  let(:key_result) { create :key_result }
  let(:goal) { create :goal, :with_key_results }

  before { goal }

  it 'has a valid factory' do
    expect(key_result).to be_valid
  end

  it { is_expected.to be_a(KeyResult) }

  describe '#by_goal' do
    subject { KeyResult.by_goal(goal.id) }

    it 'return key results of the gaol' do
      expect(subject.pluck(:id)).to eq goal.key_results.pluck(:id)
    end
  end

  describe '#completed' do
    subject { KeyResult.completed }

    context 'when no key record is completed' do
      it 'return empty array' do
        expect(subject.pluck(:id)).to be_empty
      end
    end

    context 'when no key record is completed' do
      before { goal.key_results.update_all(status: KeyResult.statuses[:completed]) }

      it 'return key results with completed status' do
        expect(subject.pluck(:id)).not_to be_empty
      end
    end
  end

  describe '#progress' do
    subject { KeyResult.progress(goal) }

    it 'return 0% - because no completed key records found' do
      expect(subject).to eq '0%'
    end
  end
end
