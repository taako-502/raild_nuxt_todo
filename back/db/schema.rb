# frozen_string_literal: true

# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema[7.0].define(version: 20_231_016_201_030) do
  create_table 'tasks', charset: 'utf8mb3', collation: 'utf8mb3_general_ci', force: :cascade do |t|
    t.bigint 'user_id'
    t.string 'content'
    t.boolean 'is_completed', default: false
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
    t.index ['user_id'], name: 'fk_rails_4d2a9e4d7e'
  end

  create_table 'users', charset: 'utf8mb3', collation: 'utf8mb3_general_ci', force: :cascade do |t|
    t.string 'name'
    t.datetime 'created_at', precision: nil, null: false
    t.datetime 'updated_at', precision: nil, null: false
  end

  add_foreign_key 'tasks', 'users'
end
