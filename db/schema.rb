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

ActiveRecord::Schema.define(:version => 20140506221814) do

  create_table "albums", :force => true do |t|
    t.string  "name"
    t.string  "location"
    t.integer "ordering"
  end

  create_table "pictures", :force => true do |t|
    t.string   "description"
    t.string   "filename"
    t.string   "content_type"
    t.string   "location"
    t.string   "binary_data"
    t.datetime "created_at",           :null => false
    t.datetime "updated_at",           :null => false
    t.integer  "album_id"
    t.boolean  "slideshow"
    t.string   "title"
    t.integer  "ordering"
    t.string   "cloudinary_url"
    t.string   "cloudinary_public_id"
  end

  create_table "users", :force => true do |t|
    t.string   "name"
    t.string   "email"
    t.boolean  "admin"
    t.datetime "created_at",       :null => false
    t.datetime "updated_at",       :null => false
    t.string   "crypted_password", :null => false
    t.string   "salt",             :null => false
  end

  add_index "users", ["email"], :name => "index_users_on_email", :unique => true

end
