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

ActiveRecord::Schema.define(version: 20181031115844) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "active_admin_comments", force: :cascade do |t|
    t.string   "namespace"
    t.text     "body"
    t.string   "resource_type"
    t.integer  "resource_id"
    t.string   "author_type"
    t.integer  "author_id"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
    t.index ["author_type", "author_id"], name: "index_active_admin_comments_on_author_type_and_author_id", using: :btree
    t.index ["namespace"], name: "index_active_admin_comments_on_namespace", using: :btree
    t.index ["resource_type", "resource_id"], name: "index_active_admin_comments_on_resource_type_and_resource_id", using: :btree
  end

  create_table "admin_users", force: :cascade do |t|
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet     "current_sign_in_ip"
    t.inet     "last_sign_in_ip"
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
    t.index ["email"], name: "index_admin_users_on_email", unique: true, using: :btree
    t.index ["reset_password_token"], name: "index_admin_users_on_reset_password_token", unique: true, using: :btree
  end

  create_table "articles", force: :cascade do |t|
    t.integer  "service_id",   null: false
    t.string   "title_ru"
    t.string   "title_en"
    t.string   "title_uk"
    t.text     "text_ru"
    t.text     "text_en"
    t.text     "text_uk"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
    t.string   "slug"
    t.string   "videolink_ru"
    t.string   "videolink_en"
    t.string   "videolink_uk"
    t.index ["service_id"], name: "index_articles_on_service_id", using: :btree
  end

  create_table "articles_posts", id: false, force: :cascade do |t|
    t.integer "article_id", null: false
    t.integer "post_id",    null: false
    t.index ["article_id", "post_id"], name: "index_articles_posts_on_article_id_and_post_id", using: :btree
    t.index ["post_id", "article_id"], name: "index_articles_posts_on_post_id_and_article_id", using: :btree
  end

  create_table "comments", force: :cascade do |t|
    t.string   "author",     null: false
    t.string   "email",      null: false
    t.text     "text",       null: false
    t.integer  "post_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["post_id"], name: "index_comments_on_post_id", using: :btree
  end

  create_table "facts", force: :cascade do |t|
    t.string   "text_ru"
    t.string   "text_en"
    t.string   "text_uk"
    t.string   "logo"
    t.string   "page_type"
    t.integer  "page_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["page_type", "page_id"], name: "index_facts_on_page_type_and_page_id", using: :btree
  end

  create_table "friendly_id_slugs", force: :cascade do |t|
    t.string   "slug",                      null: false
    t.integer  "sluggable_id",              null: false
    t.string   "sluggable_type", limit: 50
    t.string   "scope"
    t.datetime "created_at"
    t.index ["slug", "sluggable_type", "scope"], name: "index_friendly_id_slugs_on_slug_and_sluggable_type_and_scope", unique: true, using: :btree
    t.index ["slug", "sluggable_type"], name: "index_friendly_id_slugs_on_slug_and_sluggable_type", using: :btree
    t.index ["sluggable_id"], name: "index_friendly_id_slugs_on_sluggable_id", using: :btree
    t.index ["sluggable_type"], name: "index_friendly_id_slugs_on_sluggable_type", using: :btree
  end

  create_table "posts", force: :cascade do |t|
    t.string   "title_ru"
    t.string   "title_en"
    t.string   "title_uk"
    t.text     "text_ru"
    t.text     "text_en"
    t.text     "text_uk"
    t.string   "author_ru"
    t.string   "author_en"
    t.string   "author_uk"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "prices", force: :cascade do |t|
    t.integer  "article_id"
    t.string   "title_ru"
    t.string   "title_en"
    t.string   "title_uk"
    t.string   "description_ru"
    t.string   "description_en"
    t.string   "description_uk"
    t.integer  "package"
    t.integer  "value"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
    t.index ["article_id"], name: "index_prices_on_article_id", using: :btree
  end

  create_table "services", force: :cascade do |t|
    t.string   "title_ru"
    t.string   "title_en"
    t.string   "title_uk"
    t.text     "text_ru"
    t.text     "text_en"
    t.text     "text_uk"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
    t.string   "slug"
    t.string   "videolink_ru"
    t.string   "videolink_en"
    t.string   "videolink_uk"
  end

  add_foreign_key "articles", "services"
  add_foreign_key "comments", "posts"
  add_foreign_key "prices", "articles"
end
