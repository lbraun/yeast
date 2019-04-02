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

ActiveRecord::Schema.define(version: 2019_04_01_150055) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"
  enable_extension "postgis"

  create_table "yeast_types", force: :cascade do |t|
    t.string "sequence_name"
    t.decimal "mcg"
    t.decimal "gvh"
    t.decimal "alm"
    t.decimal "mit"
    t.decimal "erl"
    t.decimal "pox"
    t.decimal "vac"
    t.decimal "nuc"
    t.string "localization_site"
    t.decimal "longitude"
    t.decimal "latitude"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.geography "geom", limit: {:srid=>4326, :type=>"geometry", :geographic=>true}
  end

end
