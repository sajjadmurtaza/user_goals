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

class User < ApplicationRecord
  validates :name, :email, presence: true

  has_many :goals, dependent: :destroy
  has_many :key_results, through: :goals
end
