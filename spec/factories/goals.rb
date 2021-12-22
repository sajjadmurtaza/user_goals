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
    user_id { 1 }
    title { 'MyString' }
    start_date { '2021-12-22' }
    end_date { 'MyString' }
  end
end
