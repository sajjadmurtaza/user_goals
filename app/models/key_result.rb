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

class KeyResult < ApplicationRecord
  enum status: %i[not_started progress completed]
  validates :title, :status, :goal_id, presence: true

  belongs_to :goal

  scope :by_goal, ->(goal_id) { includes(:goal).where(goal: { id: goal_id }) }
  scope :completed, -> { where(status: KeyResult.statuses[:completed]) }

  def self.progress(goal)
    all_key_results = by_goal(goal.id)
    return '0%' if all_key_results.blank?

    completed_key_results = all_key_results.completed

    "#{(all_key_results.count / completed_key_results.count) * 100.round(2)}%"
  end
end
