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

ActiveRecord::Schema.define(version: 2019_12_19_025901) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "addresses", force: :cascade do |t|
    t.string "line_1"
    t.string "line_2"
    t.bigint "user_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["user_id"], name: "index_addresses_on_user_id"
  end

  create_table "categories", force: :cascade do |t|
    t.string "gender"
    t.string "name"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "child_categories", force: :cascade do |t|
    t.bigint "category_id", null: false
    t.string "name"
    t.string "gender"
    t.string "image_path"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["category_id"], name: "index_child_categories_on_category_id"
  end

  create_table "orders", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["user_id"], name: "index_orders_on_user_id"
  end

  create_table "orders_products", force: :cascade do |t|
    t.bigint "product_id", null: false
    t.bigint "order_id", null: false
    t.index ["order_id"], name: "index_orders_products_on_order_id"
    t.index ["product_id"], name: "index_orders_products_on_product_id"
  end

  create_table "product_images", force: :cascade do |t|
    t.bigint "product_id", null: false
    t.string "front_url"
    t.string "side_url"
    t.string "back_url"
    t.string "full_url"
    t.string "detail_url"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "small_front_url"
    t.string "small_side_url"
    t.string "small_back_url"
    t.string "small_full_url"
    t.string "small_detail_url"
    t.index ["product_id"], name: "index_product_images_on_product_id"
  end

  create_table "products", force: :cascade do |t|
    t.string "brand"
    t.string "category_name"
    t.boolean "coming_soon"
    t.string "description"
    t.string "description_of_deal"
    t.string "display_name"
    t.boolean "free_shipping"
    t.string "image_extension"
    t.boolean "student_deal"
    t.string "item_code"
    t.boolean "on_sale"
    t.string "orig_product_id"
    t.string "product_share_link"
    t.string "product_size_chart"
    t.string "list_price"
    t.string "shipping_fee"
    t.bigint "child_category_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["child_category_id"], name: "index_products_on_child_category_id"
  end

  create_table "products_users", force: :cascade do |t|
    t.bigint "product_id", null: false
    t.bigint "user_id", null: false
    t.integer "quantity"
    t.index ["product_id"], name: "index_products_users_on_product_id"
    t.index ["user_id"], name: "index_products_users_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "username"
    t.string "password_digest"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "variant_images", force: :cascade do |t|
    t.bigint "variant_id", null: false
    t.string "front_url"
    t.string "side_url"
    t.string "back_url"
    t.string "full_url"
    t.string "detail_url"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "small_front_url"
    t.string "small_side_url"
    t.string "small_back_url"
    t.string "small_full_url"
    t.string "small_detail_url"
    t.index ["variant_id"], name: "index_variant_images_on_variant_id"
  end

  create_table "variants", force: :cascade do |t|
    t.bigint "product_id", null: false
    t.string "color_name"
    t.string "color_id"
    t.string "image_extension"
    t.string "list_price"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["product_id"], name: "index_variants_on_product_id"
  end

  create_table "wish_lists", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.bigint "product_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["product_id"], name: "index_wish_lists_on_product_id"
    t.index ["user_id"], name: "index_wish_lists_on_user_id"
  end

  add_foreign_key "addresses", "users"
  add_foreign_key "child_categories", "categories"
  add_foreign_key "orders", "users"
  add_foreign_key "orders_products", "orders"
  add_foreign_key "orders_products", "products"
  add_foreign_key "product_images", "products"
  add_foreign_key "products", "child_categories"
  add_foreign_key "products_users", "products"
  add_foreign_key "products_users", "users"
  add_foreign_key "variant_images", "variants"
  add_foreign_key "variants", "products"
  add_foreign_key "wish_lists", "products"
  add_foreign_key "wish_lists", "users"
end
