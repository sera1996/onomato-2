# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2020_06_15_154945) do

  create_table "accounts", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_accounts_on_email", unique: true
    t.index ["reset_password_token"], name: "index_accounts_on_reset_password_token", unique: true
  end

  create_table "active_storage_attachments", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "name", null: false
    t.string "record_type", null: false
    t.bigint "record_id", null: false
    t.bigint "blob_id", null: false
    t.datetime "created_at", null: false
    t.index ["blob_id"], name: "index_active_storage_attachments_on_blob_id"
    t.index ["record_type", "record_id", "name", "blob_id"], name: "index_active_storage_attachments_uniqueness", unique: true
  end

  create_table "active_storage_blobs", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "key", null: false
    t.string "filename", null: false
    t.string "content_type"
    t.text "metadata"
    t.bigint "byte_size", null: false
    t.string "checksum", null: false
    t.datetime "created_at", null: false
    t.index ["key"], name: "index_active_storage_blobs_on_key", unique: true
  end

  create_table "categories", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.text "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "favors", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.integer "survey_id"
    t.integer "sara"
    t.integer "sube"
    t.integer "tsuru"
    t.integer "deko"
    t.integer "gasa"
    t.integer "zara"
    t.integer "fuwa"
    t.integer "buwa"
    t.integer "buyo"
    t.integer "puru"
    t.integer "gunya"
    t.integer "fuka"
    t.integer "funya"
    t.integer "muchi"
    t.integer "gotsu"
    t.integer "gowa"
    t.integer "kachi"
    t.integer "beta"
    t.integer "beto"
    t.integer "becho"
    t.integer "bisho"
    t.integer "bicha"
    t.integer "gusho"
    t.integer "jiku"
    t.integer "boso"
    t.integer "poso"
    t.integer "kasa"
    t.integer "pasa"
    t.integer "neba"
    t.integer "nechi"
    t.integer "neto"
    t.integer "necha"
    t.integer "nume"
    t.integer "nuru"
    t.integer "nyuru"
    t.integer "gito"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "dimension_name"
  end

  create_table "onomatopoeia", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.text "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "category_id"
    t.text "description"
    t.text "kana"
  end

  create_table "py_nums", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.text "sentence"
    t.text "vocab"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "samples", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.text "sentence"
    t.integer "onomatopoeium_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "surveys", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.boolean "emboss", default: false
    t.boolean "favor", default: false
    t.boolean "hardness", default: false
    t.boolean "wetness", default: false
    t.boolean "elastic", default: false
    t.boolean "adhesive", default: false
    t.boolean "friction", default: false
  end

  add_foreign_key "active_storage_attachments", "active_storage_blobs", column: "blob_id"
end
