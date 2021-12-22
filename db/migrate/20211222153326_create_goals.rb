# frozen_string_literal: true

class CreateGoals < ActiveRecord::Migration[7.0]
  def change
    create_table :goals do |t|
      t.integer :user_id
      t.string :title
      t.date :start_date
      t.string :end_date

      t.timestamps
    end

    add_index :goals, :title
  end
end
