# frozen_string_literal: true

class CreateKeyResults < ActiveRecord::Migration[7.0]
  def change
    create_table :key_results do |t|
      t.integer :goal_id
      t.string :title
      t.integer :status, default: 0

      t.timestamps
    end

    add_index :key_results, :title
  end
end
