# == Schema Information
#
# Table name: key_results
#
#  id         :integer          not null, primary key
#  goal_id    :integer
#  title      :string
#  status     :integer          default("0")
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

# frozen_string_literal: true

FactoryBot.define do
  factory :key_result do
    goal_id { 1 }
    title { 'MyString' }
    status { 1 }
  end
end
