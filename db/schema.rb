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

ActiveRecord::Schema.define(version: 20131224140152) do

  create_table "drivers", force: true do |t|
    t.string   "cargo"
    t.string   "ci"
    t.string   "nombre"
    t.string   "apellidopaterno"
    t.string   "apellidomaterno"
    t.integer  "celular"
    t.string   "estadochofer"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "reservations", force: true do |t|
    t.integer  "driver_id"
    t.integer  "vehicle_id"
    t.datetime "inicio"
    t.datetime "fin"
    t.text     "descripcion"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "estado"
  end

  add_index "reservations", ["driver_id"], name: "index_reservations_on_driver_id"
  add_index "reservations", ["vehicle_id"], name: "index_reservations_on_vehicle_id"

  create_table "users", force: true do |t|
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true

  create_table "vehicles", force: true do |t|
    t.string   "patente"
    t.string   "marca"
    t.string   "modelovehiculo"
    t.string   "aniovehiculo"
    t.string   "color"
    t.string   "nrchasis"
    t.string   "garantia"
    t.text     "descripcion"
    t.string   "estado"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
