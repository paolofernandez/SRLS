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

ActiveRecord::Schema.define(:version => 20130910221326) do

  create_table "baptism_books", :force => true do |t|
    t.string   "codigo"
    t.integer  "numero"
    t.integer  "paginas"
    t.integer  "partidas_pagina"
    t.boolean  "validado"
    t.integer  "user_id"
    t.datetime "created_at",      :null => false
    t.datetime "updated_at",      :null => false
    t.string   "parroquia"
  end

  add_index "baptism_books", ["user_id"], :name => "index_baptism_books_on_user_id"

  create_table "baptism_items", :force => true do |t|
    t.integer  "tomo_libro"
    t.integer  "numero"
    t.string   "nombre"
    t.date     "fecha_bautizo"
    t.string   "celebrante"
    t.string   "lugar_nacimiento"
    t.string   "fecha_nacimiento"
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
    t.datetime "created_at",       :null => false
    t.datetime "updated_at",       :null => false
    t.integer  "pagina"
  end

  add_index "baptism_items", ["baptism_book_id"], :name => "index_baptism_items_on_baptism_book_id"
  add_index "baptism_items", ["user_id"], :name => "index_baptism_items_on_user_id"

  create_table "change_logs", :force => true do |t|
    t.datetime "hora"
    t.string   "tabla"
    t.integer  "id_objeto"
    t.integer  "user_id"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  add_index "change_logs", ["user_id"], :name => "index_change_logs_on_user_id"

  create_table "churches", :force => true do |t|
    t.string   "nombre"
    t.string   "zona"
    t.string   "vicaria"
    t.string   "codigo"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "confirmation_books", :force => true do |t|
    t.string   "codigo"
    t.integer  "numero"
    t.integer  "paginas"
    t.integer  "partidas_pagina"
    t.boolean  "validado"
    t.integer  "user_id"
    t.datetime "created_at",      :null => false
    t.datetime "updated_at",      :null => false
  end

  add_index "confirmation_books", ["user_id"], :name => "index_confirmation_books_on_user_id"

  create_table "confirmation_items", :force => true do |t|
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
    t.datetime "created_at",             :null => false
    t.datetime "updated_at",             :null => false
    t.integer  "pagina"
  end

  add_index "confirmation_items", ["confirmation_book_id"], :name => "index_confirmation_items_on_confirmation_book_id"
  add_index "confirmation_items", ["user_id"], :name => "index_confirmation_items_on_user_id"

  create_table "death_record_books", :force => true do |t|
    t.string   "codigo"
    t.integer  "numero"
    t.string   "parroquia"
    t.integer  "paginas"
    t.integer  "partidas_pagina"
    t.boolean  "validado"
    t.integer  "user_id"
    t.datetime "created_at",      :null => false
    t.datetime "updated_at",      :null => false
  end

  add_index "death_record_books", ["user_id"], :name => "index_death_record_books_on_user_id"

  create_table "death_record_items", :force => true do |t|
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
    t.datetime "created_at",           :null => false
    t.datetime "updated_at",           :null => false
    t.integer  "pagina"
  end

  add_index "death_record_items", ["death_record_book_id"], :name => "index_death_record_items_on_death_record_book_id"
  add_index "death_record_items", ["user_id"], :name => "index_death_record_items_on_user_id"

  create_table "marriege_books", :force => true do |t|
    t.string   "codigo"
    t.integer  "numero"
    t.string   "parroquia"
    t.integer  "paginas"
    t.integer  "partidas_pagina"
    t.boolean  "validado"
    t.integer  "user_id"
    t.datetime "created_at",      :null => false
    t.datetime "updated_at",      :null => false
  end

  add_index "marriege_books", ["user_id"], :name => "index_marriege_books_on_user_id"

  create_table "marriege_items", :force => true do |t|
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
    t.datetime "created_at",                   :null => false
    t.datetime "updated_at",                   :null => false
    t.integer  "pagina"
  end

  add_index "marriege_items", ["marriege_book_id"], :name => "index_marriege_items_on_marriege_book_id"
  add_index "marriege_items", ["user_id"], :name => "index_marriege_items_on_user_id"

  create_table "user_logs", :force => true do |t|
    t.datetime "entrada"
    t.datetime "salida"
    t.integer  "user_id"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  add_index "user_logs", ["user_id"], :name => "index_user_logs_on_user_id"

  create_table "user_managers", :force => true do |t|
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "users", :force => true do |t|
    t.string   "email",                  :default => "", :null => false
    t.string   "encrypted_password",     :default => "", :null => false
    t.integer  "rol",                    :default => 1
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          :default => 0
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at",                             :null => false
    t.datetime "updated_at",                             :null => false
  end

  add_index "users", ["email"], :name => "index_users_on_email", :unique => true
  add_index "users", ["reset_password_token"], :name => "index_users_on_reset_password_token", :unique => true

end
