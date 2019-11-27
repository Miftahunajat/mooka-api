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

ActiveRecord::Schema.define(version: 2019_11_27_164227) do

  create_table "_community_poins", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.bigint "community_id"
    t.bigint "umkm_id"
    t.decimal "point", precision: 10
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["community_id"], name: "index__community_poins_on_community_id"
    t.index ["umkm_id"], name: "index__community_poins_on_umkm_id"
  end

  create_table "carts", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.bigint "user_id"
    t.bigint "umkm_id"
    t.bigint "product_id"
    t.decimal "count", precision: 10
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["product_id"], name: "index_carts_on_product_id"
    t.index ["umkm_id"], name: "index_carts_on_umkm_id"
    t.index ["user_id"], name: "index_carts_on_user_id"
  end

  create_table "communities", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.decimal "member_count", precision: 10
    t.string "title"
    t.string "subtitle"
    t.string "banner"
    t.boolean "official"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "community_umkms", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.bigint "community_id"
    t.bigint "umkm_id"
    t.boolean "is_admin"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.decimal "point", precision: 10, default: "0"
    t.index ["community_id"], name: "index_community_umkms_on_community_id"
    t.index ["umkm_id"], name: "index_community_umkms_on_umkm_id"
  end

  create_table "inboxes", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "tipe"
    t.string "judul"
    t.string "text"
    t.bigint "umkm_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["umkm_id"], name: "index_inboxes_on_umkm_id"
  end

  create_table "jenis_umkms", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "tipe_umkm"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "notifications", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.decimal "tipe", precision: 10
    t.string "judul"
    t.string "text"
    t.bigint "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_notifications_on_user_id"
  end

  create_table "orders", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.bigint "umkm_id"
    t.bigint "user_id"
    t.bigint "product_id"
    t.string "status"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["product_id"], name: "index_orders_on_product_id"
    t.index ["umkm_id"], name: "index_orders_on_umkm_id"
    t.index ["user_id"], name: "index_orders_on_user_id"
  end

  create_table "pengirimen", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "nama"
    t.decimal "harga", precision: 10
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "products", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.bigint "umkm_id"
    t.string "gambar"
    t.decimal "stock", precision: 10, default: "0"
    t.string "title"
    t.decimal "harga", precision: 10, default: "0"
    t.decimal "rating", precision: 12, scale: 2, default: "0.0"
    t.decimal "buy_count", precision: 10, default: "0"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["umkm_id"], name: "index_products_on_umkm_id"
  end

  create_table "ulasans", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.decimal "rating_count", precision: 10
    t.bigint "user_id"
    t.bigint "product_id"
    t.string "comment"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["product_id"], name: "index_ulasans_on_product_id"
    t.index ["user_id"], name: "index_ulasans_on_user_id"
  end

  create_table "umkms", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "nama"
    t.string "email"
    t.string "nama_pemilik"
    t.string "gambar"
    t.string "alamat"
    t.bigint "jenis_umkm_id"
    t.string "siup"
    t.string "logo"
    t.string "kota"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "phone"
    t.string "password"
    t.decimal "point", precision: 10, default: "0"
    t.index ["jenis_umkm_id"], name: "index_umkms_on_jenis_umkm_id"
  end

  create_table "user_types", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "jenis_user"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "nama"
    t.string "password"
    t.string "email"
    t.string "kota"
    t.decimal "total_donasi", precision: 15, scale: 5, default: "0.0"
    t.decimal "saldo", precision: 15, scale: 5, default: "100000.0"
    t.string "no_telfon"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users_favorites", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.bigint "user_id"
    t.bigint "product_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["product_id"], name: "index_users_favorites_on_product_id"
    t.index ["user_id"], name: "index_users_favorites_on_user_id"
  end

  add_foreign_key "_community_poins", "communities"
  add_foreign_key "_community_poins", "umkms"
  add_foreign_key "carts", "products"
  add_foreign_key "carts", "umkms"
  add_foreign_key "carts", "users"
  add_foreign_key "community_umkms", "communities"
  add_foreign_key "community_umkms", "umkms"
  add_foreign_key "inboxes", "umkms"
  add_foreign_key "notifications", "users"
  add_foreign_key "orders", "products"
  add_foreign_key "orders", "umkms"
  add_foreign_key "orders", "users"
  add_foreign_key "products", "umkms"
  add_foreign_key "ulasans", "products"
  add_foreign_key "ulasans", "users"
  add_foreign_key "umkms", "jenis_umkms"
  add_foreign_key "users_favorites", "products"
  add_foreign_key "users_favorites", "users"
end
