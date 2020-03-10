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

ActiveRecord::Schema.define(version: 20191208084914) do

  create_table "accounts", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string "name"
    t.string "token"
    t.bigint "user_id"
    t.string "provider"
    t.string "code"
    t.string "comment"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.boolean "commenter"
    t.text "proxy"
    t.integer "sex", default: 0
    t.index ["user_id"], name: "index_accounts_on_user_id"
  end

  create_table "api_vk_error_logs", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string "method"
    t.text "response"
    t.bigint "account_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "error_code"
    t.index ["account_id"], name: "index_api_vk_error_logs_on_account_id"
  end

  create_table "comment_accounts", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.integer "owner_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "comment_logs", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.integer "owner_id"
    t.integer "post_id"
    t.bigint "account_id"
    t.integer "comment_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "commented_id"
    t.index ["account_id"], name: "index_comment_logs_on_account_id"
    t.index ["owner_id", "post_id", "account_id"], name: "index_comment_logs_on_owner_id_and_post_id_and_account_id"
    t.index ["post_id", "comment_id"], name: "index_comment_logs_on_post_id_and_comment_id"
    t.index ["post_id"], name: "index_comment_logs_on_post_id"
  end

  create_table "comment_posts", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.bigint "user_id"
    t.integer "owner_id"
    t.integer "post_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_comment_posts_on_user_id"
  end

  create_table "keyphrases", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string "value"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "last_posts", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.bigint "post_group_id"
    t.bigint "post_id"
    t.bigint "account_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["account_id"], name: "index_last_posts_on_account_id"
    t.index ["post_group_id", "post_id", "account_id"], name: "index_last_posts_on_post_group_id_and_post_id_and_account_id", unique: true
    t.index ["post_group_id"], name: "index_last_posts_on_post_group_id"
    t.index ["post_id"], name: "index_last_posts_on_post_id"
  end

  create_table "phrases", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.text "value"
    t.bigint "keyphrase_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.datetime "used_at"
    t.integer "sort"
    t.index ["keyphrase_id"], name: "index_phrases_on_keyphrase_id"
  end

  create_table "post_groups", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "posts", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.text "body"
    t.bigint "post_group_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["post_group_id"], name: "index_posts_on_post_group_id"
  end

  create_table "potirs", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string "name"
    t.integer "parent_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "tails", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.integer "friend_id"
    t.string "status"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.text "response"
    t.bigint "account_id"
    t.string "error_code"
    t.string "captcha_sid"
    t.string "captcha_img"
    t.boolean "resolved_captcha", default: false
    t.index ["account_id"], name: "index_tails_on_account_id"
    t.index ["friend_id"], name: "index_tails_on_friend_id_and_user_id"
  end

  create_table "total_phrases", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.text "value"
    t.string "part"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer "sign_in_count", default: 0, null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string "current_sign_in_ip"
    t.string "last_sign_in_ip"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.boolean "admin", default: false
    t.text "info"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "accounts", "users"
  add_foreign_key "api_vk_error_logs", "accounts"
  add_foreign_key "comment_logs", "accounts"
  add_foreign_key "comment_posts", "users"
  add_foreign_key "last_posts", "accounts"
  add_foreign_key "last_posts", "post_groups"
  add_foreign_key "last_posts", "posts"
  add_foreign_key "phrases", "keyphrases"
  add_foreign_key "posts", "post_groups"
  add_foreign_key "tails", "accounts"
end
