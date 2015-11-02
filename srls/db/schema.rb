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
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 20140107150512) do

  create_table "baptism_books", force: :cascade do |t|
    t.string   "codigo"
    t.integer  "numero"
    t.integer  "paginas"
    t.integer  "partidas_pagina"
    t.boolean  "validado"
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "parroquia"
  end

  add_index "baptism_books", ["user_id"], name: "index_baptism_books_on_user_id"

  create_table "baptism_items", force: :cascade do |t|
    t.integer  "tomo_libro"
    t.integer  "numero"
    t.string   "nombre"
    t.date     "fecha_bautizo"
    t.string   "celebrante"
    t.string   "lugar_nacimiento"
    t.date     "fecha_nacimiento"
    t.string   "tipo_hijo"
    t.string   "padre"
    t.string   "madre"
    t.string   "feligreses"
    t.string   "padrino"
    t.string   "madrina"
    t.string   "oficialia"
    t.string   "encargado"
    t.boolean  "validado"
    t.integer  "user_id"
    t.integer  "baptism_book_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "pagina"
    t.integer  "oficialiaLibro"
    t.integer  "oficialiaPartida"
    t.integer  "oficialiaFs"
  end

  add_index "baptism_items", ["baptism_book_id"], name: "index_baptism_items_on_baptism_book_id"
  add_index "baptism_items", ["user_id"], name: "index_baptism_items_on_user_id"

  create_table "change_logs", force: :cascade do |t|
    t.datetime "hora"
    t.string   "tabla"
    t.integer  "id_objeto"
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "change_logs", ["user_id"], name: "index_change_logs_on_user_id"

  create_table "churches", force: :cascade do |t|
    t.string   "nombre"
    t.string   "vicaria"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "confirmation_books", force: :cascade do |t|
    t.string   "codigo"
    t.integer  "numero"
    t.integer  "paginas"
    t.integer  "partidas_pagina"
    t.boolean  "validado"
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "confirmation_books", ["user_id"], name: "index_confirmation_books_on_user_id"

  create_table "confirmation_items", force: :cascade do |t|
    t.integer  "tomo_libro"
    t.integer  "numero"
    t.string   "nombre"
    t.integer  "edad"
    t.string   "padre"
    t.string   "madre"
    t.string   "padrino"
    t.string   "madrina"
    t.string   "parroquia_confirmacion"
    t.date     "fecha_confirmacion"
    t.string   "parroquia_bautizo"
    t.date     "fecha_bautizo"
    t.string   "celebrante"
    t.boolean  "validado"
    t.integer  "user_id"
    t.integer  "confirmation_book_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "pagina"
  end

  add_index "confirmation_items", ["confirmation_book_id"], name: "index_confirmation_items_on_confirmation_book_id"
  add_index "confirmation_items", ["user_id"], name: "index_confirmation_items_on_user_id"

  create_table "death_record_books", force: :cascade do |t|
    t.string   "codigo"
    t.integer  "numero"
    t.string   "parroquia"
    t.integer  "paginas"
    t.integer  "partidas_pagina"
    t.boolean  "validado"
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "death_record_books", ["user_id"], name: "index_death_record_books_on_user_id"

  create_table "death_record_items", force: :cascade do |t|
    t.string   "tomo_libro"
    t.integer  "numero"
    t.string   "nombre"
    t.date     "fecha"
    t.integer  "edad"
    t.string   "motivo_muerte"
    t.string   "tipo_hijo"
    t.string   "padre"
    t.string   "madre"
    t.string   "lugar_sepultura"
    t.string   "celebrante"
    t.boolean  "validado"
    t.integer  "user_id"
    t.integer  "death_record_book_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "pagina"
  end

  add_index "death_record_items", ["death_record_book_id"], name: "index_death_record_items_on_death_record_book_id"
  add_index "death_record_items", ["user_id"], name: "index_death_record_items_on_user_id"

  create_table "marriege_books", force: :cascade do |t|
    t.string   "codigo"
    t.integer  "numero"
    t.string   "parroquia"
    t.integer  "paginas"
    t.integer  "partidas_pagina"
    t.boolean  "validado"
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "marriege_books", ["user_id"], name: "index_marriege_books_on_user_id"

  create_table "marriege_items", force: :cascade do |t|
    t.integer  "tomo_libro"
    t.integer  "numero"
    t.date     "fecha_matrimonio"
    t.string   "celebrante"
    t.string   "nombre_esposo"
    t.integer  "edad_esposo"
    t.string   "profesion_esposo"
    t.string   "tipo_hijo_esposo"
    t.string   "padre_esposo"
    t.string   "madre_esposo"
    t.string   "lugar_nacimiento_esposo"
    t.date     "fecha_nacimiento_esposo"
    t.string   "parroquia_bautizo_esposo"
    t.date     "fecha_bautizo_esposo"
    t.string   "nombre_esposa"
    t.integer  "edad_esposa"
    t.string   "profesion_esposa"
    t.string   "tipo_hijo_esposa"
    t.string   "padre_esposa"
    t.string   "madre_esposa"
    t.string   "lugar_nacimiento_esposa"
    t.date     "fecha_nacimiento_esposa"
    t.string   "parroquia_bautizo_esposa"
    t.date     "fecha_bautizo_esposa"
    t.string   "feligreses"
    t.string   "primer_testigo"
    t.string   "segundo_testigo"
    t.string   "encargado"
    t.string   "oficialia"
    t.integer  "num_partida_libreta_familiar"
    t.string   "bendicion_nupcial_de"
    t.string   "en_el"
    t.date     "en_fecha"
    t.boolean  "validado"
    t.integer  "user_id"
    t.integer  "marriege_book_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "pagina"
  end

  add_index "marriege_items", ["marriege_book_id"], name: "index_marriege_items_on_marriege_book_id"
  add_index "marriege_items", ["user_id"], name: "index_marriege_items_on_user_id"

  create_table "updated_data_table_items", force: :cascade do |t|
    t.string   "item"
    t.string   "old_data"
    t.string   "new_data"
    t.integer  "updated_data_table_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "updated_data_table_items", ["updated_data_table_id"], name: "index_updated_data_table_items_on_updated_data_table_id"

  create_table "updated_data_tables", force: :cascade do |t|
    t.string   "source_table"
    t.integer  "id_datum"
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "updated_data_tables", ["user_id"], name: "index_updated_data_tables_on_user_id"

  create_table "user_logs", force: :cascade do |t|
    t.datetime "entrada"
    t.datetime "salida"
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "user_logs", ["user_id"], name: "index_user_logs_on_user_id"

  create_table "user_managers", force: :cascade do |t|
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "users", force: :cascade do |t|
    t.string   "email",                  default: "",   null: false
    t.string   "encrypted_password",     default: "",   null: false
    t.integer  "rol",                    default: 1
    t.boolean  "status",                 default: true
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "clave"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true

  create_table "validators", force: :cascade do |t|
    t.text     "comentario"
    t.boolean  "valido",     default: false
    t.string   "tabla"
    t.integer  "id_dato"
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "validators", ["user_id"], name: "index_validators_on_user_id"

end
