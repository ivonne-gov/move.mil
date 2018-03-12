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

ActiveRecord::Schema.define(version: 20180312190846) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "branch_of_service_contacts", force: :cascade do |t|
    t.text "custsvc_org"
    t.text "custsvc_dsn"
    t.text "custsvc_tel_comm"
    t.text "custsvc_tel_tollfree"
    t.text "custsvc_email"
    t.text "custsvc_hours"
    t.text "custsvc_url"
    t.text "custsvc_facebook_url"
    t.text "claims_dsn"
    t.text "claims_tel_comm"
    t.text "claims_tel_tollfree"
    t.text "claims_fax_dsn"
    t.text "claims_fax_comm"
    t.text "claims_fax_tollfree"
    t.text "claims_email"
    t.text "claims_post"
    t.text "retiree_dsn"
    t.text "retiree_tel_comm"
    t.text "retiree_tel_tollfree"
    t.text "retiree_fax_dsn"
    t.text "retiree_fax_comm"
    t.text "retiree_fax_tollfree"
    t.text "retiree_email"
    t.text "retiree_post"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.text "claims_url"
    t.bigint "branch_of_service_id"
    t.text "ppm_website"
    t.text "ppm_tel_comm"
    t.index ["branch_of_service_id"], name: "index_branch_of_service_contacts_on_branch_of_service_id"
  end

  create_table "branch_of_services", force: :cascade do |t|
    t.string "name", null: false
    t.integer "display_order", null: false
    t.string "slug", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "cms_comments", id: :serial, force: :cascade do |t|
    t.string "author"
    t.string "author_email"
    t.string "author_url"
    t.string "author_IP"
    t.text "content"
    t.string "approved", default: "pending"
    t.string "agent"
    t.string "typee"
    t.integer "comment_parent"
    t.integer "post_id"
    t.integer "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["approved"], name: "index_cms_comments_on_approved"
    t.index ["comment_parent"], name: "index_cms_comments_on_comment_parent"
    t.index ["post_id"], name: "index_cms_comments_on_post_id"
    t.index ["user_id"], name: "index_cms_comments_on_user_id"
  end

  create_table "cms_custom_fields", id: :serial, force: :cascade do |t|
    t.string "object_class"
    t.string "name"
    t.string "slug"
    t.integer "objectid"
    t.integer "parent_id"
    t.integer "field_order"
    t.integer "count", default: 0
    t.boolean "is_repeat", default: false
    t.text "description"
    t.string "status"
    t.index ["object_class"], name: "index_cms_custom_fields_on_object_class"
    t.index ["objectid"], name: "index_cms_custom_fields_on_objectid"
    t.index ["parent_id"], name: "index_cms_custom_fields_on_parent_id"
    t.index ["slug"], name: "index_cms_custom_fields_on_slug"
  end

  create_table "cms_custom_fields_relationships", id: :serial, force: :cascade do |t|
    t.integer "objectid"
    t.integer "custom_field_id"
    t.integer "term_order"
    t.string "object_class"
    t.text "value"
    t.string "custom_field_slug"
    t.integer "group_number", default: 0
    t.index ["custom_field_id"], name: "index_cms_custom_fields_relationships_on_custom_field_id"
    t.index ["custom_field_slug"], name: "index_cms_custom_fields_relationships_on_custom_field_slug"
    t.index ["object_class"], name: "index_cms_custom_fields_relationships_on_object_class"
    t.index ["objectid"], name: "index_cms_custom_fields_relationships_on_objectid"
  end

  create_table "cms_metas", id: :serial, force: :cascade do |t|
    t.string "key"
    t.text "value"
    t.integer "objectid"
    t.string "object_class"
    t.index ["key"], name: "index_cms_metas_on_key"
    t.index ["object_class"], name: "index_cms_metas_on_object_class"
    t.index ["objectid"], name: "index_cms_metas_on_objectid"
  end

  create_table "cms_posts", id: :serial, force: :cascade do |t|
    t.string "title"
    t.string "slug"
    t.text "content"
    t.text "content_filtered"
    t.string "status", default: "published"
    t.datetime "published_at"
    t.integer "post_parent"
    t.string "visibility", default: "public"
    t.text "visibility_value"
    t.string "post_class", default: "Post"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "user_id"
    t.integer "post_order", default: 0
    t.integer "taxonomy_id"
    t.boolean "is_feature", default: false
    t.index ["post_class"], name: "index_cms_posts_on_post_class"
    t.index ["post_parent"], name: "index_cms_posts_on_post_parent"
    t.index ["slug"], name: "index_cms_posts_on_slug"
    t.index ["status"], name: "index_cms_posts_on_status"
    t.index ["user_id"], name: "index_cms_posts_on_user_id"
  end

  create_table "cms_term_relationships", id: :serial, force: :cascade do |t|
    t.integer "objectid"
    t.integer "term_order"
    t.integer "term_taxonomy_id"
    t.index ["objectid"], name: "index_cms_term_relationships_on_objectid"
    t.index ["term_order"], name: "index_cms_term_relationships_on_term_order"
    t.index ["term_taxonomy_id"], name: "index_cms_term_relationships_on_term_taxonomy_id"
  end

  create_table "cms_term_taxonomy", id: :serial, force: :cascade do |t|
    t.string "taxonomy"
    t.text "description"
    t.integer "parent_id"
    t.integer "count"
    t.string "name"
    t.string "slug"
    t.integer "term_group"
    t.integer "term_order"
    t.string "status"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "user_id"
    t.index ["parent_id"], name: "index_cms_term_taxonomy_on_parent_id"
    t.index ["slug"], name: "index_cms_term_taxonomy_on_slug"
    t.index ["taxonomy"], name: "index_cms_term_taxonomy_on_taxonomy"
    t.index ["term_order"], name: "index_cms_term_taxonomy_on_term_order"
    t.index ["user_id"], name: "index_cms_term_taxonomy_on_user_id"
  end

  create_table "cms_users", id: :serial, force: :cascade do |t|
    t.string "username"
    t.string "role", default: "client"
    t.string "email"
    t.string "slug"
    t.string "password_digest"
    t.string "auth_token"
    t.string "password_reset_token"
    t.integer "parent_id"
    t.datetime "password_reset_sent_at"
    t.datetime "last_login_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "site_id", default: -1
    t.string "confirm_email_token"
    t.datetime "confirm_email_sent_at"
    t.boolean "is_valid_email", default: true
    t.string "first_name"
    t.string "last_name"
    t.index ["email"], name: "index_cms_users_on_email"
    t.index ["role"], name: "index_cms_users_on_role"
    t.index ["site_id"], name: "index_cms_users_on_site_id"
    t.index ["username"], name: "index_cms_users_on_username"
  end

  create_table "dtod_zip3_distances", force: :cascade do |t|
    t.integer "orig_zip3"
    t.integer "dest_zip3"
    t.float "dist_mi"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "entitlements", force: :cascade do |t|
    t.string "rank", null: false
    t.integer "total_weight_self", null: false
    t.integer "total_weight_self_plus_dependents"
    t.integer "pro_gear_weight"
    t.integer "pro_gear_weight_spouse"
    t.text "slug"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "faqs", force: :cascade do |t|
    t.text "question", null: false
    t.text "answer", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.text "category"
  end

  create_table "full_packs", force: :cascade do |t|
    t.integer "schedule"
    t.int4range "weight_lbs"
    t.decimal "rate", precision: 7, scale: 2
    t.daterange "effective"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "full_unpacks", force: :cascade do |t|
    t.integer "schedule"
    t.decimal "rate", precision: 8, scale: 5
    t.daterange "effective"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "household_good_categories", force: :cascade do |t|
    t.string "name", null: false
    t.string "icon", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["name"], name: "index_household_good_categories_on_name", unique: true
  end

  create_table "household_goods", force: :cascade do |t|
    t.string "name"
    t.integer "weight"
    t.bigint "household_good_category_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["household_good_category_id"], name: "index_household_goods_on_household_good_category_id"
  end

  create_table "linehauls", force: :cascade do |t|
    t.int4range "dist_mi"
    t.int4range "weight_lbs"
    t.integer "rate"
    t.daterange "effective"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "type"
  end

  create_table "locations", force: :cascade do |t|
    t.string "locatable_type"
    t.bigint "locatable_id"
    t.text "street_address"
    t.text "extended_address"
    t.text "locality"
    t.text "region"
    t.text "region_code"
    t.text "postal_code"
    t.text "country_name"
    t.text "country_code"
    t.float "latitude", null: false
    t.float "longitude", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["locatable_type", "locatable_id"], name: "index_locations_on_locatable_type_and_locatable_id"
  end

  create_table "plugins_contact_forms", id: :serial, force: :cascade do |t|
    t.integer "site_id"
    t.integer "count"
    t.integer "parent_id"
    t.string "name"
    t.string "slug"
    t.text "description"
    t.text "value"
    t.text "settings"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "service_areas", force: :cascade do |t|
    t.integer "service_area"
    t.text "name"
    t.integer "services_schedule"
    t.decimal "linehaul_factor", precision: 7, scale: 2
    t.decimal "orig_dest_service_charge", precision: 7, scale: 2
    t.daterange "effective"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "service_specific_posts", force: :cascade do |t|
    t.text "title"
    t.date "effective_at"
    t.text "content"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "branch_of_service_id"
    t.index ["branch_of_service_id"], name: "index_service_specific_posts_on_branch_of_service_id"
  end

  create_table "shipping_offices", force: :cascade do |t|
    t.text "name", null: false
    t.json "email_addresses", default: []
    t.json "phone_numbers", default: []
    t.json "urls", default: []
    t.text "services", default: [], array: true
    t.text "hours"
    t.text "note"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "shorthauls", force: :cascade do |t|
    t.int4range "cwt_mi"
    t.decimal "rate", precision: 7, scale: 2
    t.daterange "effective"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "top_tsp_by_channel_linehaul_discounts", force: :cascade do |t|
    t.text "orig"
    t.text "dest"
    t.daterange "tdl"
    t.decimal "discount"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["tdl"], name: "index_top_tsp_by_channel_linehaul_discounts_on_tdl"
  end

  create_table "transportation_offices", force: :cascade do |t|
    t.bigint "shipping_office_id"
    t.text "name", null: false
    t.json "email_addresses", default: []
    t.json "phone_numbers", default: []
    t.json "urls", default: []
    t.text "services", default: [], array: true
    t.text "hours"
    t.text "note"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["shipping_office_id"], name: "index_transportation_offices_on_shipping_office_id"
  end

  create_table "tutorial_steps", force: :cascade do |t|
    t.bigint "tutorial_id"
    t.text "content", null: false
    t.text "image_path"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.text "pro_tip"
    t.index ["tutorial_id"], name: "index_tutorial_steps_on_tutorial_id"
  end

  create_table "tutorials", force: :cascade do |t|
    t.text "title", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.text "slug", null: false
    t.integer "display_order"
  end

  create_table "weight_scales", force: :cascade do |t|
    t.text "name", null: false
    t.json "email_addresses", default: []
    t.json "phone_numbers", default: []
    t.json "urls", default: []
    t.text "hours"
    t.text "note"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "zip3s", force: :cascade do |t|
    t.integer "zip3"
    t.text "basepoint_city"
    t.text "state"
    t.integer "service_area"
    t.text "rate_area"
    t.integer "region"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "zip5_rate_areas", force: :cascade do |t|
    t.integer "zip5"
    t.text "rate_area"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_foreign_key "branch_of_service_contacts", "branch_of_services"
  add_foreign_key "household_goods", "household_good_categories"
  add_foreign_key "service_specific_posts", "branch_of_services"
  add_foreign_key "transportation_offices", "shipping_offices"
  add_foreign_key "tutorial_steps", "tutorials"
end
