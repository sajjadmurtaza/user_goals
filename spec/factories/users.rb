# == Schema Information
#
# Table name: users
#
#  id         :integer          not null, primary key
#  name       :string
#  email      :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

# frozen_string_literal: true

FactoryBot.define do
  factory :user do
    name { 'Jhon' }
    email { 'jhon@gmail.com' }

    trait :with_goals do
      after(:create) do |user|
        user.goals << create(:goal)
      end
    end
  end
end
