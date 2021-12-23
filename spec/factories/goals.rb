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

FactoryBot.define do
  factory :goal do
    title { 'Grow our engineering team' }
    start_date { '2021-12-22' }
    end_date { '2022-12-22' }

    association :user

    trait :with_key_results do
      after(:create) do |goal|
        goal.key_results << create(:key_result)
      end
    end
  end
end
