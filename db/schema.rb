# encoding: UTF-8
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
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20121122153439) do

  create_table "blogs", :force => true do |t|
    t.string   "title"
    t.text     "content"
    t.datetime "created_at",              :null => false
    t.datetime "updated_at",              :null => false
    t.string   "blog_image_file_name"
    t.string   "blog_image_content_type"
    t.integer  "blog_image_file_size"
    t.datetime "blog_image_updated_at"
    t.datetime "published_at"
    t.text     "description"
  end

  create_table "ckeditor_assets", :force => true do |t|
    t.string   "data_file_name",                  :null => false
    t.string   "data_content_type"
    t.integer  "data_file_size"
    t.integer  "assetable_id"
    t.string   "assetable_type",    :limit => 30
    t.string   "type",              :limit => 30
    t.integer  "width"
    t.integer  "height"
    t.datetime "created_at",                      :null => false
    t.datetime "updated_at",                      :null => false
  end

  add_index "ckeditor_assets", ["assetable_type", "assetable_id"], :name => "idx_ckeditor_assetable"
  add_index "ckeditor_assets", ["assetable_type", "type", "assetable_id"], :name => "idx_ckeditor_assetable_type"

  create_table "fashion_juries", :force => true do |t|
    t.integer  "score",                           :default => 0
    t.text     "content"
    t.integer  "comments_count",                  :default => 0
    t.datetime "created_at",                                     :null => false
    t.datetime "updated_at",                                     :null => false
    t.string   "fashion_jury_image_file_name"
    t.string   "fashion_jury_image_content_type"
    t.integer  "fashion_jury_image_file_size"
    t.datetime "fashion_jury_image_updated_at"
    t.string   "title"
    t.datetime "published_at"
  end

  create_table "fashion_tips", :force => true do |t|
    t.string   "title"
    t.text     "body"
    t.datetime "published_at"
    t.datetime "created_at",             :null => false
    t.datetime "updated_at",             :null => false
    t.string   "tip_image_file_name"
    t.string   "tip_image_content_type"
    t.integer  "tip_image_file_size"
    t.datetime "tip_image_updated_at"
  end

  create_table "features", :force => true do |t|
    t.string   "title"
    t.text     "content"
    t.string   "quote"
    t.integer  "user_id"
    t.datetime "created_at",                 :null => false
    t.datetime "updated_at",                 :null => false
    t.string   "feature_image_file_name"
    t.string   "feature_image_content_type"
    t.integer  "feature_image_file_size"
    t.datetime "feature_image_updated_at"
    t.string   "quote_owner"
    t.string   "top_image_file_name"
    t.string   "top_image_content_type"
    t.integer  "top_image_file_size"
    t.datetime "top_image_updated_at"
    t.datetime "published_at"
  end

  create_table "functional_fashion_designers", :force => true do |t|
    t.string   "name"
    t.datetime "created_at",        :null => false
    t.datetime "updated_at",        :null => false
    t.string   "icon_file_name"
    t.string   "icon_content_type"
    t.integer  "icon_file_size"
    t.datetime "icon_updated_at"
    t.text     "description"
  end

  create_table "functional_fashions", :force => true do |t|
    t.integer  "user_id"
    t.text     "content"
    t.datetime "created_at",                            :null => false
    t.datetime "updated_at",                            :null => false
    t.string   "functional_fashion_image_file_name"
    t.string   "functional_fashion_image_content_type"
    t.integer  "functional_fashion_image_file_size"
    t.datetime "functional_fashion_image_updated_at"
    t.integer  "functional_fashion_designer_id"
    t.datetime "published_at"
  end

  create_table "look_books", :force => true do |t|
    t.string   "name"
    t.string   "description"
    t.datetime "created_at",   :null => false
    t.datetime "updated_at",   :null => false
    t.datetime "published_at"
  end

  create_table "magazines", :force => true do |t|
    t.string   "title"
    t.datetime "published_at"
    t.text     "description"
    t.datetime "created_at",             :null => false
    t.datetime "updated_at",             :null => false
    t.string   "mag_cover_file_name"
    t.string   "mag_cover_content_type"
    t.integer  "mag_cover_file_size"
    t.datetime "mag_cover_updated_at"
  end

  create_table "men_fashions", :force => true do |t|
    t.string   "title"
    t.string   "content"
    t.datetime "created_at",                     :null => false
    t.datetime "updated_at",                     :null => false
    t.string   "men_fashion_image_file_name"
    t.string   "men_fashion_image_content_type"
    t.integer  "men_fashion_image_file_size"
    t.datetime "men_fashion_image_updated_at"
    t.datetime "published_at"
  end

  create_table "photos", :force => true do |t|
    t.text     "caption"
    t.string   "photoable_type",     :default => "", :null => false
    t.integer  "photoable_id",                       :null => false
    t.datetime "created_at",                         :null => false
    t.datetime "updated_at",                         :null => false
    t.string   "photo_file_name"
    t.string   "photo_content_type"
    t.integer  "photo_file_size"
    t.datetime "photo_updated_at"
  end

  add_index "photos", ["photoable_id", "photoable_type"], :name => "index_photos_on_photoable_id_and_photoable_type"

  create_table "redcarpets", :force => true do |t|
    t.string   "title"
    t.datetime "created_at",   :null => false
    t.datetime "updated_at",   :null => false
    t.datetime "published_at"
  end

  create_table "right_ads", :force => true do |t|
    t.string   "name"
    t.string   "url"
    t.string   "position"
    t.datetime "created_at",                :null => false
    t.datetime "updated_at",                :null => false
    t.string   "right_banner_file_name"
    t.string   "right_banner_content_type"
    t.integer  "right_banner_file_size"
    t.datetime "right_banner_updated_at"
    t.datetime "start_date"
    t.datetime "end_date"
  end

  create_table "runway_collections", :force => true do |t|
    t.string   "name"
    t.integer  "year_id"
    t.integer  "season_id"
    t.datetime "created_at",                    :null => false
    t.datetime "updated_at",                    :null => false
    t.datetime "published_at"
    t.string   "collection_cover_file_name"
    t.string   "collection_cover_content_type"
    t.integer  "collection_cover_file_size"
    t.datetime "collection_cover_updated_at"
  end

  add_index "runway_collections", ["season_id"], :name => "index_runway_collections_on_season_id"
  add_index "runway_collections", ["year_id"], :name => "index_runway_collections_on_year_id"

  create_table "runway_seasons", :force => true do |t|
    t.string   "name"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "runway_years", :force => true do |t|
    t.string   "name"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "slides", :force => true do |t|
    t.string   "caption"
    t.string   "url"
    t.datetime "created_at",               :null => false
    t.datetime "updated_at",               :null => false
    t.string   "slide_image_file_name"
    t.string   "slide_image_content_type"
    t.integer  "slide_image_file_size"
    t.datetime "slide_image_updated_at"
    t.datetime "published_at"
    t.string   "title"
  end

  create_table "subscriptions", :force => true do |t|
    t.string   "email",      :null => false
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  add_index "subscriptions", ["email"], :name => "index_subscriptions_on_email", :unique => true

  create_table "taggings", :force => true do |t|
    t.integer  "tag_id"
    t.integer  "taggable_id"
    t.string   "taggable_type"
    t.integer  "tagger_id"
    t.string   "tagger_type"
    t.string   "context",       :limit => 128
    t.datetime "created_at"
  end

  add_index "taggings", ["tag_id"], :name => "index_taggings_on_tag_id"
  add_index "taggings", ["taggable_id", "taggable_type", "context"], :name => "index_taggings_on_taggable_id_and_taggable_type_and_context"

  create_table "tags", :force => true do |t|
    t.string "name"
  end

  create_table "tips", :force => true do |t|
    t.string   "title"
    t.text     "body"
    t.datetime "created_at",             :null => false
    t.datetime "updated_at",             :null => false
    t.datetime "published_at"
    t.string   "tip_image_file_name"
    t.string   "tip_image_content_type"
    t.integer  "tip_image_file_size"
    t.datetime "tip_image_updated_at"
  end

  create_table "top_ads", :force => true do |t|
    t.string   "name"
    t.string   "url"
    t.string   "position"
    t.datetime "created_at",              :null => false
    t.datetime "updated_at",              :null => false
    t.string   "top_banner_file_name"
    t.string   "top_banner_content_type"
    t.integer  "top_banner_file_size"
    t.datetime "top_banner_updated_at"
    t.datetime "start_date"
    t.datetime "end_date"
  end

  create_table "trend_spottings", :force => true do |t|
    t.string   "title"
    t.text     "description"
    t.datetime "created_at",               :null => false
    t.datetime "updated_at",               :null => false
    t.string   "trend_cover_file_name"
    t.string   "trend_cover_content_type"
    t.integer  "trend_cover_file_size"
    t.datetime "trend_cover_updated_at"
    t.string   "caption"
    t.datetime "published_at"
  end

  create_table "users", :force => true do |t|
    t.string   "email",                  :default => "",    :null => false
    t.string   "encrypted_password",     :default => "",    :null => false
    t.string   "name"
    t.string   "image"
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          :default => 0
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at",                                :null => false
    t.datetime "updated_at",                                :null => false
    t.string   "provider"
    t.string   "uid"
    t.boolean  "admin",                  :default => false
  end

  add_index "users", ["email"], :name => "index_users_on_email", :unique => true
  add_index "users", ["reset_password_token"], :name => "index_users_on_reset_password_token", :unique => true

  create_table "videos", :force => true do |t|
    t.string   "description"
    t.string   "title"
    t.datetime "created_at",               :null => false
    t.datetime "updated_at",               :null => false
    t.string   "screen_shot_file_name"
    t.string   "screen_shot_content_type"
    t.integer  "screen_shot_file_size"
    t.datetime "screen_shot_updated_at"
    t.datetime "published_at"
    t.string   "mp4_file_name"
    t.string   "mp4_content_type"
    t.integer  "mp4_file_size"
    t.datetime "mp4_updated_at"
    t.string   "youtube_video_id"
  end

end
