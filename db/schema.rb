# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `rails
# db:schema:load`. When creating a new database, `rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2020_07_28_183329) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "railway_ipc_consumed_messages", id: false, force: :cascade do |t|
    t.uuid "uuid", null: false
    t.string "message_type"
    t.uuid "user_uuid"
    t.uuid "correlation_id"
    t.text "encoded_message"
    t.string "status", null: false
    t.string "queue"
    t.string "exchange"
    t.datetime "updated_at"
    t.datetime "inserted_at"
    t.index ["uuid", "queue"], name: "index_railway_ipc_consumed_messages_on_uuid_and_queue", unique: true
  end

  create_table "railway_ipc_published_messages", id: false, force: :cascade do |t|
    t.uuid "uuid", null: false
    t.string "message_type"
    t.uuid "user_uuid"
    t.uuid "correlation_id"
    t.text "encoded_message"
    t.string "status", null: false
    t.string "exchange"
    t.datetime "updated_at"
    t.datetime "inserted_at"
    t.index ["uuid"], name: "index_railway_ipc_published_messages_on_uuid", unique: true
  end

end
