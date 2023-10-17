# frozen_string_literal: true

class CreateTasks < ActiveRecord::Migration[7.0]
  def change
    create_table :tasks do |t|
      t.bigint :user_id
      t.string :content
      t.boolean :is_completed, default: false

      t.timestamps
    end
    add_foreign_key :tasks, :users
  end
end
