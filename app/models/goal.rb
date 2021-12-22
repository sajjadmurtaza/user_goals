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

class Goal < ApplicationRecord
  validates :title, :user_id, presence: true

  belongs_to :user
  has_many :key_results, dependent: :destroy

  scope :by_user, ->(user_id) { includes(:user, :key_results).where(id: user_id) }
end
