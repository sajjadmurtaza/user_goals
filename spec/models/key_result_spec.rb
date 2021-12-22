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

require 'rails_helper'

RSpec.describe KeyResult, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
