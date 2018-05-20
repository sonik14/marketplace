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

ActiveRecord::Schema.define(version: 20180320161740) do

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

  create_table "adv_chars", force: :cascade do |t|
    t.integer  "category_adv_id",                          null: false
    t.string   "name",                                     null: false
    t.integer  "avail",           limit: 2, default: 1,    null: false
    t.integer  "scale"
    t.integer  "prod_char_id"
    t.boolean  "acceptBetter",              default: true, null: false
    t.integer  "function_id"
    t.datetime "created_at",                               null: false
    t.datetime "updated_at",                               null: false
    t.index ["avail"], name: "index_adv_chars_on_avail", using: :btree
    t.index ["category_adv_id", "scale"], name: "index_adv_chars_on_category_adv_id_and_scale", unique: true, using: :btree
    t.index ["category_adv_id"], name: "index_adv_chars_on_category_adv_id", using: :btree
    t.index ["function_id"], name: "index_adv_chars_on_function_id", using: :btree
    t.index ["name"], name: "index_adv_chars_on_name", using: :btree
    t.index ["prod_char_id"], name: "index_adv_chars_on_prod_char_id", using: :btree
  end

  create_table "adv_media", force: :cascade do |t|
    t.integer  "version_id", null: false
    t.string   "name",       null: false
    t.integer  "cost"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["name"], name: "index_adv_media_on_name", using: :btree
    t.index ["version_id"], name: "index_adv_media_on_version_id", using: :btree
  end

  create_table "category_advs", force: :cascade do |t|
    t.integer  "version_id",                           null: false
    t.string   "name",                                 null: false
    t.integer  "M",          limit: 2
    t.boolean  "multiple",             default: false, null: false
    t.boolean  "comperable",           default: true,  null: false
    t.datetime "created_at",                           null: false
    t.datetime "updated_at",                           null: false
    t.index ["name"], name: "index_category_advs_on_name", using: :btree
    t.index ["version_id"], name: "index_category_advs_on_version_id", using: :btree
  end

  create_table "category_prods", force: :cascade do |t|
    t.integer  "version_id",                           null: false
    t.string   "name",                                 null: false
    t.integer  "M",          limit: 2
    t.boolean  "multiple",             default: false, null: false
    t.boolean  "compulsory",           default: true,  null: false
    t.boolean  "comperable",           default: true,  null: false
    t.datetime "created_at",                           null: false
    t.datetime "updated_at",                           null: false
    t.index ["name"], name: "index_category_prods_on_name", using: :btree
    t.index ["version_id"], name: "index_category_prods_on_version_id", using: :btree
  end

  create_table "chat_gs", force: :cascade do |t|
    t.integer  "game_id",    null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["game_id"], name: "index_chat_gs_on_game_id", using: :btree
  end

  create_table "chat_lines", force: :cascade do |t|
    t.integer  "chat_g_id",  null: false
    t.text     "text",       null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["chat_g_id"], name: "index_chat_lines_on_chat_g_id", using: :btree
  end

  create_table "chat_users", force: :cascade do |t|
    t.integer  "chat_g_id",  null: false
    t.integer  "user_id",    null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["chat_g_id", "user_id"], name: "index_chat_users_on_chat_g_id_and_user_id", unique: true, using: :btree
    t.index ["chat_g_id"], name: "index_chat_users_on_chat_g_id", using: :btree
    t.index ["user_id"], name: "index_chat_users_on_user_id", using: :btree
  end

  create_table "cities", force: :cascade do |t|
    t.string   "name",         null: false
    t.integer  "population"
    t.integer  "continent_id", null: false
    t.integer  "advC"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
    t.index ["continent_id"], name: "index_cities_on_continent_id", using: :btree
    t.index ["name"], name: "index_cities_on_name", using: :btree
  end

  create_table "comp_adv_chars", force: :cascade do |t|
    t.integer  "comp_adv_id",           null: false
    t.integer  "adv_char_id",           null: false
    t.integer  "Seq",         limit: 2, null: false
    t.datetime "created_at",            null: false
    t.datetime "updated_at",            null: false
    t.index ["adv_char_id"], name: "index_comp_adv_chars_on_adv_char_id", using: :btree
    t.index ["comp_adv_id", "Seq"], name: "index_comp_adv_chars_on_comp_adv_id_and_Seq", unique: true, using: :btree
    t.index ["comp_adv_id", "adv_char_id"], name: "index_comp_adv_chars_on_comp_adv_id_and_adv_char_id", unique: true, using: :btree
    t.index ["comp_adv_id"], name: "index_comp_adv_chars_on_comp_adv_id", using: :btree
  end

  create_table "comp_adv_q_cities", force: :cascade do |t|
    t.integer  "comp_adv_q_id",           null: false
    t.integer  "city_id",                 null: false
    t.integer  "appearancesNo", limit: 2
    t.datetime "created_at",              null: false
    t.datetime "updated_at",              null: false
    t.index ["city_id"], name: "index_comp_adv_q_cities_on_city_id", using: :btree
    t.index ["comp_adv_q_id", "city_id"], name: "index_comp_adv_q_cities_on_comp_adv_q_id_and_city_id", unique: true, using: :btree
    t.index ["comp_adv_q_id"], name: "index_comp_adv_q_cities_on_comp_adv_q_id", using: :btree
  end

  create_table "comp_adv_q_media", force: :cascade do |t|
    t.integer  "comp_adv_q_id",           null: false
    t.integer  "adv_medium_id",           null: false
    t.integer  "appearancesNo", limit: 2
    t.datetime "created_at",              null: false
    t.datetime "updated_at",              null: false
    t.index ["adv_medium_id"], name: "index_comp_adv_q_media_on_adv_medium_id", using: :btree
    t.index ["comp_adv_q_id", "adv_medium_id"], name: "index_comp_adv_q_media_on_comp_adv_q_id_and_adv_medium_id", unique: true, using: :btree
    t.index ["comp_adv_q_id"], name: "index_comp_adv_q_media_on_comp_adv_q_id", using: :btree
  end

  create_table "comp_adv_qs", force: :cascade do |t|
    t.integer  "comp_adv_id",                null: false
    t.integer  "quarter_id",                 null: false
    t.integer  "appearancesPPTot"
    t.integer  "TotCPP"
    t.integer  "evaluation",       limit: 2
    t.datetime "created_at",                 null: false
    t.datetime "updated_at",                 null: false
    t.index ["comp_adv_id"], name: "index_comp_adv_qs_on_comp_adv_id", using: :btree
    t.index ["quarter_id", "comp_adv_id"], name: "index_comp_adv_qs_on_quarter_id_and_comp_adv_id", unique: true, using: :btree
    t.index ["quarter_id"], name: "index_comp_adv_qs_on_quarter_id", using: :btree
  end

  create_table "comp_advs", force: :cascade do |t|
    t.integer  "comp_q_id",  null: false
    t.integer  "q_end_id"
    t.string   "name",       null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["comp_q_id"], name: "index_comp_advs_on_comp_q_id", using: :btree
    t.index ["name", "comp_q_id"], name: "index_comp_advs_on_name_and_comp_q_id", unique: true, using: :btree
    t.index ["name"], name: "index_comp_advs_on_name", using: :btree
  end

  create_table "comp_goals", force: :cascade do |t|
    t.integer  "company_id"
    t.integer  "goal_id"
    t.boolean  "chosen"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["company_id", "goal_id"], name: "index_comp_goals_on_company_id_and_goal_id", unique: true, using: :btree
    t.index ["company_id"], name: "index_comp_goals_on_company_id", using: :btree
    t.index ["goal_id"], name: "index_comp_goals_on_goal_id", using: :btree
  end

  create_table "comp_prod_adv_custs", force: :cascade do |t|
    t.integer  "comp_prod_id",           null: false
    t.integer  "comp_adv_id",            null: false
    t.integer  "customer_id",            null: false
    t.integer  "advEval",      limit: 2
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
    t.index ["comp_adv_id"], name: "index_comp_prod_adv_custs_on_comp_adv_id", using: :btree
    t.index ["comp_prod_id", "comp_adv_id", "customer_id"], name: "index_comp_prod_adv_custs_on_comp_prod_comp_adv_customer", unique: true, using: :btree
    t.index ["comp_prod_id"], name: "index_comp_prod_adv_custs_on_comp_prod_id", using: :btree
    t.index ["customer_id"], name: "index_comp_prod_adv_custs_on_customer_id", using: :btree
  end

  create_table "comp_prod_advs", force: :cascade do |t|
    t.integer  "comp_prod_id"
    t.integer  "comp_adv_id",                  null: false
    t.boolean  "falseAdv",     default: false
    t.datetime "created_at",                   null: false
    t.datetime "updated_at",                   null: false
    t.index ["comp_adv_id"], name: "index_comp_prod_advs_on_comp_adv_id", using: :btree
    t.index ["comp_prod_id", "comp_adv_id"], name: "index_comp_prod_advs_on_comp_prod_id_and_comp_adv_id", unique: true, using: :btree
    t.index ["comp_prod_id"], name: "index_comp_prod_advs_on_comp_prod_id", using: :btree
  end

  create_table "comp_prod_chars", force: :cascade do |t|
    t.integer  "prod_char_id", null: false
    t.integer  "comp_q_id",    null: false
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
    t.index ["comp_q_id"], name: "index_comp_prod_chars_on_comp_q_id", using: :btree
    t.index ["prod_char_id", "comp_q_id"], name: "index_comp_prod_chars_on_prod_char_id_and_comp_q_id", unique: true, using: :btree
    t.index ["prod_char_id"], name: "index_comp_prod_chars_on_prod_char_id", using: :btree
  end

  create_table "comp_prod_custs", force: :cascade do |t|
    t.integer  "comp_prod_id",           null: false
    t.integer  "customer_id",            null: false
    t.integer  "prodEval",     limit: 2
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
    t.index ["comp_prod_id", "customer_id"], name: "index_comp_prod_custs_on_comp_prod_id_and_customer_id", unique: true, using: :btree
    t.index ["comp_prod_id"], name: "index_comp_prod_custs_on_comp_prod_id", using: :btree
    t.index ["customer_id"], name: "index_comp_prod_custs_on_customer_id", using: :btree
  end

  create_table "comp_prod_mq_cust_cities", force: :cascade do |t|
    t.integer  "mq_id",                    null: false
    t.integer  "comp_prod_q_cust_city_id", null: false
    t.integer  "noD"
    t.integer  "noB"
    t.integer  "noNotBbutAvail"
    t.integer  "noIll"
    t.integer  "noRebuys"
    t.datetime "created_at",               null: false
    t.datetime "updated_at",               null: false
    t.index ["comp_prod_q_cust_city_id"], name: "index_comp_prod_mq_cust_cities_on_comp_prod_q_cust_city_id", using: :btree
    t.index ["mq_id", "comp_prod_q_cust_city_id"], name: "index_comp_prod_mq_cust_cities_on_cpmqcc", unique: true, using: :btree
    t.index ["mq_id"], name: "index_comp_prod_mq_cust_cities_on_mq_id", using: :btree
  end

  create_table "comp_prod_q_cities", force: :cascade do |t|
    t.integer  "comp_prod_q_id",           null: false
    t.integer  "city_id",                  null: false
    t.integer  "advAVGEval",     limit: 2
    t.integer  "pricedEval",     limit: 2
    t.integer  "qualityEval",    limit: 2
    t.datetime "created_at",               null: false
    t.datetime "updated_at",               null: false
    t.index ["city_id"], name: "index_comp_prod_q_cities_on_city_id", using: :btree
    t.index ["comp_prod_q_id", "city_id"], name: "index_comp_prod_q_cities_on_comp_prod_q_id_and_city_id", unique: true, using: :btree
    t.index ["comp_prod_q_id"], name: "index_comp_prod_q_cities_on_comp_prod_q_id", using: :btree
  end

  create_table "comp_prod_q_cust_cities", force: :cascade do |t|
    t.integer  "comp_prod_id",        null: false
    t.integer  "comp_q_cust_city_id", null: false
    t.integer  "noD"
    t.integer  "noB"
    t.integer  "noNotBbutAvail"
    t.integer  "noIll"
    t.integer  "noRebuys"
    t.datetime "created_at",          null: false
    t.datetime "updated_at",          null: false
    t.index ["comp_prod_id", "comp_q_cust_city_id"], name: "index_comp_prod_q_cust_cities_on_cpqcc", unique: true, using: :btree
    t.index ["comp_prod_id"], name: "index_comp_prod_q_cust_cities_on_comp_prod_id", using: :btree
    t.index ["comp_q_cust_city_id"], name: "index_comp_prod_q_cust_cities_on_comp_q_cust_city_id", using: :btree
  end

  create_table "comp_prod_q_stores", force: :cascade do |t|
    t.integer  "comp_prod_q_id",                  null: false
    t.integer  "comp_q_store_id",                 null: false
    t.integer  "salesNo"
    t.integer  "TotC"
    t.integer  "price"
    t.integer  "discount"
    t.integer  "Seq"
    t.boolean  "promotionPrior",  default: false
    t.datetime "created_at",                      null: false
    t.datetime "updated_at",                      null: false
    t.index ["comp_prod_q_id", "comp_q_store_id"], name: "index_comp_prod_q_stores_on_comp_prod_q_id_and_comp_q_store_id", unique: true, using: :btree
    t.index ["comp_prod_q_id"], name: "index_comp_prod_q_stores_on_comp_prod_q_id", using: :btree
    t.index ["comp_q_store_id"], name: "index_comp_prod_q_stores_on_comp_q_store_id", using: :btree
  end

  create_table "comp_prod_q_webs", force: :cascade do |t|
    t.integer  "comp_prod_q_id", null: false
    t.integer  "comp_q_web_id",  null: false
    t.integer  "salesNo"
    t.integer  "TotC"
    t.integer  "price"
    t.integer  "discount"
    t.integer  "Seq"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
    t.index ["comp_prod_q_id", "comp_q_web_id", "Seq"], name: "index_comp_prod_q_webs_on_prod_q_and_web_and_Seq", unique: true, using: :btree
    t.index ["comp_prod_q_id", "comp_q_web_id"], name: "index_comp_prod_q_webs_on_comp_prod_q_id_and_comp_q_web_id", unique: true, using: :btree
    t.index ["comp_prod_q_id"], name: "index_comp_prod_q_webs_on_comp_prod_q_id", using: :btree
    t.index ["comp_q_web_id"], name: "index_comp_prod_q_webs_on_comp_q_web_id", using: :btree
  end

  create_table "comp_prod_qs", force: :cascade do |t|
    t.integer  "comp_prod_id",                 null: false
    t.integer  "quarter_id",                   null: false
    t.integer  "productionSeq",      limit: 2
    t.integer  "salesNo"
    t.integer  "productionNo"
    t.integer  "stockNo"
    t.integer  "lostSalesNo"
    t.integer  "clearanceSaleNo"
    t.integer  "clearanceSalePrice"
    t.integer  "productionStart"
    t.integer  "productionStop"
    t.integer  "TotIncomePP"
    t.integer  "TotExpensesPP"
    t.integer  "TotGrossMarginPP"
    t.integer  "evaluationPrice",    limit: 2
    t.integer  "evaluationQuality",  limit: 2
    t.datetime "created_at",                   null: false
    t.datetime "updated_at",                   null: false
    t.index ["comp_prod_id"], name: "index_comp_prod_qs_on_comp_prod_id", using: :btree
    t.index ["quarter_id", "comp_prod_id"], name: "index_comp_prod_qs_on_quarter_id_and_comp_prod_id", unique: true, using: :btree
    t.index ["quarter_id", "productionSeq"], name: "index_comp_prod_qs_on_quarter_id_and_productionSeq", unique: true, using: :btree
    t.index ["quarter_id"], name: "index_comp_prod_qs_on_quarter_id", using: :btree
  end

  create_table "comp_prods", force: :cascade do |t|
    t.integer  "comp_q_id",  null: false
    t.integer  "q_end_id"
    t.string   "name",       null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["comp_q_id"], name: "index_comp_prods_on_comp_q_id", using: :btree
    t.index ["name", "comp_q_id"], name: "index_comp_prods_on_name_and_comp_q_id", unique: true, using: :btree
    t.index ["name"], name: "index_comp_prods_on_name", using: :btree
  end

  create_table "comp_q_cust_cities", force: :cascade do |t|
    t.integer  "comp_q_id",                                null: false
    t.integer  "cust_city_id",                             null: false
    t.integer  "noIllTot"
    t.integer  "noResearchD"
    t.integer  "noResearchB"
    t.integer  "noResearchSample"
    t.decimal  "noResearchBE",     precision: 3, scale: 2
    t.datetime "created_at",                               null: false
    t.datetime "updated_at",                               null: false
    t.index ["comp_q_id", "cust_city_id"], name: "index_comp_q_cust_cities_on_comp_q_id_and_cust_city_id", unique: true, using: :btree
    t.index ["comp_q_id"], name: "index_comp_q_cust_cities_on_comp_q_id", using: :btree
    t.index ["cust_city_id"], name: "index_comp_q_cust_cities_on_cust_city_id", using: :btree
  end

  create_table "comp_q_educs", force: :cascade do |t|
    t.integer  "comp_q_id"
    t.integer  "education_id"
    t.integer  "CPP"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
    t.index ["comp_q_id", "education_id"], name: "index_comp_q_educs_on_comp_q_id_and_education_id", unique: true, using: :btree
    t.index ["comp_q_id"], name: "index_comp_q_educs_on_comp_q_id", using: :btree
    t.index ["education_id"], name: "index_comp_q_educs_on_education_id", using: :btree
  end

  create_table "comp_q_fins", force: :cascade do |t|
    t.integer  "fin_line_item_id", null: false
    t.integer  "comp_q_id",        null: false
    t.integer  "value"
    t.datetime "created_at",       null: false
    t.datetime "updated_at",       null: false
    t.index ["comp_q_id"], name: "index_comp_q_fins_on_comp_q_id", using: :btree
    t.index ["fin_line_item_id", "comp_q_id"], name: "index_comp_q_fins_on_fin_line_item_id_and_comp_q_id", unique: true, using: :btree
    t.index ["fin_line_item_id"], name: "index_comp_q_fins_on_fin_line_item_id", using: :btree
  end

  create_table "comp_q_loans", force: :cascade do |t|
    t.integer  "loan_id",                null: false
    t.integer  "comp_q_id",              null: false
    t.integer  "shares",     default: 0
    t.integer  "amount"
    t.integer  "duration"
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
    t.index ["comp_q_id"], name: "index_comp_q_loans_on_comp_q_id", using: :btree
    t.index ["loan_id", "comp_q_id"], name: "index_comp_q_loans_on_loan_id_and_comp_q_id", unique: true, using: :btree
    t.index ["loan_id"], name: "index_comp_q_loans_on_loan_id", using: :btree
  end

  create_table "comp_q_priors", force: :cascade do |t|
    t.integer  "comp_q_id",             null: false
    t.integer  "customer_id",           null: false
    t.integer  "Seq",         limit: 2
    t.datetime "created_at",            null: false
    t.datetime "updated_at",            null: false
    t.index ["comp_q_id", "Seq"], name: "index_comp_q_priors_on_comp_q_id_and_Seq", unique: true, using: :btree
    t.index ["comp_q_id"], name: "index_comp_q_priors_on_comp_q_id", using: :btree
    t.index ["customer_id"], name: "index_comp_q_priors_on_customer_id", using: :btree
  end

  create_table "comp_q_scores", force: :cascade do |t|
    t.integer  "score_id",                           null: false
    t.integer  "comp_q_id",                          null: false
    t.decimal  "score",      precision: 8, scale: 2
    t.datetime "created_at",                         null: false
    t.datetime "updated_at",                         null: false
    t.index ["comp_q_id"], name: "index_comp_q_scores_on_comp_q_id", using: :btree
    t.index ["score_id", "comp_q_id"], name: "index_comp_q_scores_on_score_id_and_comp_q_id", unique: true, using: :btree
    t.index ["score_id"], name: "index_comp_q_scores_on_score_id", using: :btree
  end

  create_table "comp_q_searches", force: :cascade do |t|
    t.integer  "comp_q_id",    null: false
    t.integer  "continent_id", null: false
    t.boolean  "avail"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
    t.index ["comp_q_id", "continent_id"], name: "index_comp_q_searches_on_comp_q_id_and_continent_id", unique: true, using: :btree
    t.index ["comp_q_id"], name: "index_comp_q_searches_on_comp_q_id", using: :btree
    t.index ["continent_id"], name: "index_comp_q_searches_on_continent_id", using: :btree
  end

  create_table "comp_q_store_custs", force: :cascade do |t|
    t.integer  "comp_q_store_id",           null: false
    t.integer  "customer_id",               null: false
    t.integer  "NoE",             limit: 2
    t.integer  "salesPE"
    t.integer  "bonusPE"
    t.integer  "giftPE"
    t.integer  "TotSalary"
    t.integer  "TotNoSales"
    t.datetime "created_at",                null: false
    t.datetime "updated_at",                null: false
    t.index ["comp_q_store_id", "customer_id"], name: "index_comp_q_store_custs_on_comp_q_store_id_and_customer_id", unique: true, using: :btree
    t.index ["comp_q_store_id"], name: "index_comp_q_store_custs_on_comp_q_store_id", using: :btree
    t.index ["customer_id"], name: "index_comp_q_store_custs_on_customer_id", using: :btree
  end

  create_table "comp_q_stores", force: :cascade do |t|
    t.integer  "comp_q_id",   null: false
    t.integer  "city_id",     null: false
    t.integer  "TotNoE"
    t.integer  "TotSalary"
    t.integer  "TotIncome"
    t.integer  "TotExpenses"
    t.integer  "TotNoSales"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.index ["city_id", "comp_q_id"], name: "index_comp_q_stores_on_city_id_and_comp_q_id", unique: true, using: :btree
    t.index ["city_id"], name: "index_comp_q_stores_on_city_id", using: :btree
    t.index ["comp_q_id"], name: "index_comp_q_stores_on_comp_q_id", using: :btree
  end

  create_table "comp_q_web_supplies", force: :cascade do |t|
    t.integer  "comp_q_web_id", null: false
    t.integer  "web_supply_id", null: false
    t.integer  "SalesNo"
    t.integer  "TotCost"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
    t.index ["comp_q_web_id", "web_supply_id"], name: "index_comp_q_web_supplies_on_comp_q_web_id_and_web_supply_id", unique: true, using: :btree
    t.index ["comp_q_web_id"], name: "index_comp_q_web_supplies_on_comp_q_web_id", using: :btree
    t.index ["web_supply_id"], name: "index_comp_q_web_supplies_on_web_supply_id", using: :btree
  end

  create_table "comp_q_webs", force: :cascade do |t|
    t.integer  "comp_q_id",    null: false
    t.integer  "continent_id", null: false
    t.integer  "TotNoE"
    t.integer  "TotSalary"
    t.integer  "TotIncome"
    t.integer  "TotExpenses"
    t.integer  "TotNoSales"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
    t.index ["comp_q_id"], name: "index_comp_q_webs_on_comp_q_id", using: :btree
    t.index ["continent_id", "comp_q_id"], name: "index_comp_q_webs_on_continent_id_and_comp_q_id", unique: true, using: :btree
    t.index ["continent_id"], name: "index_comp_q_webs_on_continent_id", using: :btree
  end

  create_table "comp_qs", force: :cascade do |t|
    t.integer  "company_id",                                             null: false
    t.integer  "quarter_id",                                             null: false
    t.decimal  "fundingPer",                     precision: 3, scale: 2
    t.integer  "cash"
    t.integer  "shares"
    t.integer  "income"
    t.integer  "expenses"
    t.integer  "propertyInMoney"
    t.decimal  "reliability",                    precision: 3, scale: 2
    t.integer  "noIllPer"
    t.integer  "noIllTot"
    t.integer  "salaryE"
    t.integer  "insurance_e_id"
    t.integer  "vacationE",            limit: 2
    t.decimal  "pensionE",                       precision: 3, scale: 2
    t.integer  "salaryW"
    t.integer  "insurance_w_id"
    t.integer  "vacationW",            limit: 2
    t.decimal  "pensionW",                       precision: 3, scale: 2
    t.integer  "facTotC"
    t.integer  "capacityF",            limit: 2
    t.integer  "capacityEx",           limit: 2
    t.integer  "capacityO",            limit: 2
    t.integer  "noW"
    t.integer  "unitsF"
    t.integer  "unitsO"
    t.integer  "capacityOUsed",        limit: 2
    t.decimal  "capacityOUsedPer",               precision: 3, scale: 2
    t.integer  "capacityOUnused",      limit: 2
    t.decimal  "capacityOUnusedPer",             precision: 3, scale: 2
    t.integer  "overheadC"
    t.integer  "changeoverC"
    t.decimal  "changeoverPer",                  precision: 3, scale: 2
    t.integer  "improveChangeoverC"
    t.decimal  "imrpoveChangeoverPer",           precision: 3, scale: 2
    t.integer  "educationTotC"
    t.datetime "created_at",                                             null: false
    t.datetime "updated_at",                                             null: false
    t.index ["company_id", "quarter_id"], name: "index_comp_qs_on_company_id_and_quarter_id", unique: true, using: :btree
    t.index ["company_id"], name: "index_comp_qs_on_company_id", using: :btree
    t.index ["quarter_id"], name: "index_comp_qs_on_quarter_id", using: :btree
  end

  create_table "comp_rnds", force: :cascade do |t|
    t.integer  "seller_id"
    t.integer  "buyer_id"
    t.integer  "prod_id"
    t.integer  "quarter_id"
    t.integer  "quarterO_id"
    t.integer  "quarterM",       limit: 2, default: 255
    t.integer  "price"
    t.integer  "advancePayment",           default: 0
    t.integer  "penalty"
    t.integer  "delayPenalty"
    t.boolean  "resaleRightsS",            default: true
    t.boolean  "resaleRightsB",            default: true
    t.boolean  "signedS",                  default: false
    t.boolean  "signedB",                  default: false
    t.boolean  "cancelled",                default: false
    t.datetime "created_at",                               null: false
    t.datetime "updated_at",                               null: false
    t.index ["buyer_id", "prod_id", "cancelled", "signedS", "signedB"], name: "index_comp_rnds_on_uniqueness", using: :btree
    t.index ["buyer_id", "prod_id", "cancelled"], name: "index_comp_rnds_on_prod_avail", using: :btree
    t.index ["quarter_id"], name: "index_comp_rnds_on_quarter_id", using: :btree
    t.index ["seller_id", "buyer_id", "prod_id", "cancelled"], name: "index_comp_rnds_on_same_open_contract", using: :btree
    t.index ["seller_id", "prod_id", "quarterO_id", "cancelled"], name: "index_comp_rnds_on_buyer_id_as_seller_id", using: :btree
  end

  create_table "comp_users", force: :cascade do |t|
    t.integer  "company_id", null: false
    t.integer  "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["company_id"], name: "index_comp_users_on_company_id", using: :btree
    t.index ["user_id"], name: "index_comp_users_on_user_id", using: :btree
  end

  create_table "companies", force: :cascade do |t|
    t.integer  "game_id",      null: false
    t.integer  "ceo_id"
    t.integer  "continent_id"
    t.string   "name"
    t.string   "mission"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
    t.index ["continent_id"], name: "index_companies_on_continent_id", using: :btree
    t.index ["game_id", "ceo_id"], name: "index_companies_on_game_id_and_ceo_id", unique: true, using: :btree
    t.index ["game_id"], name: "index_companies_on_game_id", using: :btree
    t.index ["name"], name: "index_companies_on_name", using: :btree
  end

  create_table "continents", force: :cascade do |t|
    t.integer  "version_id",                                        null: false
    t.string   "name",                                              null: false
    t.string   "factoryCityName"
    t.decimal  "salaryWI",                  precision: 3, scale: 2
    t.integer  "salaryWC"
    t.decimal  "healthWI",                  precision: 3, scale: 2
    t.integer  "health_w_id"
    t.decimal  "vacationWI",                precision: 3, scale: 2
    t.integer  "vacationWW",      limit: 2
    t.integer  "vacationWC"
    t.decimal  "pensionWI",                 precision: 3, scale: 2
    t.decimal  "pensionWPer",               precision: 3, scale: 2
    t.integer  "pensionWC"
    t.decimal  "salaryEI",                  precision: 3, scale: 2
    t.integer  "salaryED"
    t.decimal  "healthEI",                  precision: 3, scale: 2
    t.integer  "health_e_id"
    t.decimal  "vacationEI",                precision: 3, scale: 2
    t.integer  "vacationDI",      limit: 2
    t.decimal  "pensionEI",                 precision: 3, scale: 2
    t.decimal  "pensionDI",                 precision: 3, scale: 2
    t.integer  "researchC"
    t.integer  "storeSetupC"
    t.integer  "storeClosureC"
    t.integer  "StoreLeaseC"
    t.integer  "hireEC"
    t.integer  "dismissEC"
    t.integer  "webSetupC"
    t.integer  "webClosureC"
    t.integer  "webLeaseC"
    t.datetime "created_at",                                        null: false
    t.datetime "updated_at",                                        null: false
    t.index ["name"], name: "index_continents_on_name", using: :btree
    t.index ["version_id"], name: "index_continents_on_version_id", using: :btree
  end

  create_table "cust_adv_chars", force: :cascade do |t|
    t.integer  "adv_char_id",                         null: false
    t.integer  "customer_id",                         null: false
    t.decimal  "weight",      precision: 3, scale: 2
    t.integer  "scale"
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
    t.index ["adv_char_id", "customer_id"], name: "index_cust_adv_chars_on_adv_char_id_and_customer_id", unique: true, using: :btree
    t.index ["adv_char_id"], name: "index_cust_adv_chars_on_adv_char_id", using: :btree
    t.index ["customer_id"], name: "index_cust_adv_chars_on_customer_id", using: :btree
  end

  create_table "cust_adv_media", force: :cascade do |t|
    t.integer  "adv_medium_id",                         null: false
    t.integer  "customer_id",                           null: false
    t.numrange "range"
    t.decimal  "interest",      precision: 3, scale: 2
    t.datetime "created_at",                            null: false
    t.datetime "updated_at",                            null: false
    t.index ["adv_medium_id", "customer_id"], name: "index_cust_adv_media_on_adv_medium_id_and_customer_id", unique: true, using: :btree
    t.index ["adv_medium_id"], name: "index_cust_adv_media_on_adv_medium_id", using: :btree
    t.index ["customer_id"], name: "index_cust_adv_media_on_customer_id", using: :btree
  end

  create_table "cust_category_advs", force: :cascade do |t|
    t.integer  "category_adv_id", null: false
    t.integer  "customer_id",     null: false
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
    t.index ["category_adv_id", "customer_id"], name: "index_cust_category_advs_on_category_adv_id_and_customer_id", unique: true, using: :btree
    t.index ["category_adv_id"], name: "index_cust_category_advs_on_category_adv_id", using: :btree
    t.index ["customer_id"], name: "index_cust_category_advs_on_customer_id", using: :btree
  end

  create_table "cust_category_prods", force: :cascade do |t|
    t.integer  "category_prod_id",                                        null: false
    t.integer  "customer_id",                                             null: false
    t.integer  "CharsWantedNo"
    t.decimal  "CharsWantedNoS",   precision: 3, scale: 2
    t.boolean  "acceptBetter",                             default: true, null: false
    t.datetime "created_at",                                              null: false
    t.datetime "updated_at",                                              null: false
    t.index ["category_prod_id", "customer_id"], name: "index_cust_category_prods_on_category_prod_id_and_customer_id", unique: true, using: :btree
    t.index ["category_prod_id"], name: "index_cust_category_prods_on_category_prod_id", using: :btree
    t.index ["customer_id"], name: "index_cust_category_prods_on_customer_id", using: :btree
  end

  create_table "cust_cities", force: :cascade do |t|
    t.integer  "city_id",          null: false
    t.integer  "customer_id",      null: false
    t.integer  "price"
    t.integer  "marketsize"
    t.integer  "EducationEC"
    t.numrange "marketsize_range"
    t.datetime "created_at",       null: false
    t.datetime "updated_at",       null: false
    t.index ["city_id", "customer_id"], name: "index_cust_cities_on_city_id_and_customer_id", unique: true, using: :btree
    t.index ["city_id"], name: "index_cust_cities_on_city_id", using: :btree
    t.index ["customer_id"], name: "index_cust_cities_on_customer_id", using: :btree
  end

  create_table "cust_funcs", force: :cascade do |t|
    t.integer  "customer_id", null: false
    t.integer  "function_id", null: false
    t.numrange "parA"
    t.numrange "parB"
    t.numrange "parC"
    t.numrange "parD"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.index ["customer_id", "function_id"], name: "index_cust_funcs_on_customer_id_and_function_id", unique: true, using: :btree
    t.index ["customer_id"], name: "index_cust_funcs_on_customer_id", using: :btree
    t.index ["function_id"], name: "index_cust_funcs_on_function_id", using: :btree
  end

  create_table "cust_g_funcs", force: :cascade do |t|
    t.integer  "cust_func_id", null: false
    t.integer  "game_id",      null: false
    t.decimal  "parA"
    t.decimal  "parB"
    t.decimal  "parC"
    t.decimal  "parD"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
    t.index ["cust_func_id", "game_id"], name: "index_cust_g_funcs_on_cust_func_id_and_game_id", unique: true, using: :btree
    t.index ["cust_func_id"], name: "index_cust_g_funcs_on_cust_func_id", using: :btree
    t.index ["game_id"], name: "index_cust_g_funcs_on_game_id", using: :btree
  end

  create_table "cust_g_mq_cities", force: :cascade do |t|
    t.integer  "cust_city_id", null: false
    t.integer  "mq_id",        null: false
    t.integer  "demandP"
    t.integer  "demandS"
    t.integer  "revisits1S"
    t.integer  "revisits2S"
    t.integer  "revisits3S"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
    t.index ["cust_city_id", "mq_id"], name: "index_cust_g_mq_cities_on_cust_city_id_and_mq_id", unique: true, using: :btree
    t.index ["cust_city_id"], name: "index_cust_g_mq_cities_on_cust_city_id", using: :btree
    t.index ["mq_id"], name: "index_cust_g_mq_cities_on_mq_id", using: :btree
  end

  create_table "cust_gs", force: :cascade do |t|
    t.integer  "customer_id",                                     null: false
    t.integer  "game_id",                                         null: false
    t.decimal  "rebuyPer",                precision: 3, scale: 2
    t.integer  "rebuyInterval", limit: 2
    t.datetime "created_at",                                      null: false
    t.datetime "updated_at",                                      null: false
    t.index ["customer_id", "game_id"], name: "index_cust_gs_on_customer_id_and_game_id", unique: true, using: :btree
    t.index ["customer_id"], name: "index_cust_gs_on_customer_id", using: :btree
    t.index ["game_id"], name: "index_cust_gs_on_game_id", using: :btree
  end

  create_table "cust_prod_chars", force: :cascade do |t|
    t.integer  "prod_char_id",                         null: false
    t.integer  "customer_id",                          null: false
    t.decimal  "weight",       precision: 3, scale: 2
    t.integer  "scale"
    t.datetime "created_at",                           null: false
    t.datetime "updated_at",                           null: false
    t.index ["customer_id"], name: "index_cust_prod_chars_on_customer_id", using: :btree
    t.index ["prod_char_id", "customer_id"], name: "index_cust_prod_chars_on_prod_char_id_and_customer_id", unique: true, using: :btree
    t.index ["prod_char_id"], name: "index_cust_prod_chars_on_prod_char_id", using: :btree
  end

  create_table "customers", force: :cascade do |t|
    t.integer  "version_id",                                            null: false
    t.string   "type",                                                  null: false
    t.numrange "marketsize_total"
    t.decimal  "revisitP",                      precision: 3, scale: 2
    t.decimal  "purchaseP",                     precision: 3, scale: 2
    t.numrange "rebuyPer_range"
    t.numrange "rebuyInterval_range"
    t.integer  "rebuyPar",            limit: 2
    t.decimal  "A1_prod_char_SI",               precision: 3, scale: 2
    t.decimal  "A2_adv_char_SI",                precision: 3, scale: 2
    t.decimal  "A3_price_SI",                   precision: 3, scale: 2
    t.decimal  "A4_quality_SI",                 precision: 3, scale: 2
    t.decimal  "a_generalI",                    precision: 3, scale: 2
    t.decimal  "a_prod_nameI",                  precision: 3, scale: 2
    t.decimal  "a_char_orderI",                 precision: 3, scale: 2
    t.integer  "priceLow"
    t.integer  "priceDef"
    t.integer  "func_price_id"
    t.integer  "priceEval"
    t.decimal  "q_D1ReliabilitySI",             precision: 3, scale: 2
    t.decimal  "q_D1ReliabilityRSI",            precision: 3, scale: 2
    t.decimal  "q_D2ReputationSI",              precision: 3, scale: 2
    t.decimal  "q_D3RealAdvSI",                 precision: 3, scale: 2
    t.decimal  "q_D4DiscountSI",                precision: 3, scale: 2
    t.integer  "adv_lines_no"
    t.decimal  "adv_lines_no_S",                precision: 3, scale: 2
    t.decimal  "advMediaI",                     precision: 3, scale: 2
    t.decimal  "advCityI",                      precision: 3, scale: 2
    t.integer  "a_appear_city_id"
    t.integer  "a_appear_media_id"
    t.datetime "created_at",                                            null: false
    t.datetime "updated_at",                                            null: false
    t.index ["type"], name: "index_customers_on_type", using: :btree
    t.index ["version_id"], name: "index_customers_on_version_id", using: :btree
  end

  create_table "educations", force: :cascade do |t|
    t.integer  "version_id", null: false
    t.string   "name",       null: false
    t.integer  "defaultCPP"
    t.integer  "duration"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["version_id"], name: "index_educations_on_version_id", using: :btree
  end

  create_table "factory_capacities", force: :cascade do |t|
    t.integer  "version_id",           null: false
    t.integer  "capacity",   limit: 2, null: false
    t.integer  "cost"
    t.integer  "noW"
    t.integer  "units"
    t.datetime "created_at",           null: false
    t.datetime "updated_at",           null: false
    t.index ["capacity"], name: "index_factory_capacities_on_capacity", using: :btree
    t.index ["version_id"], name: "index_factory_capacities_on_version_id", using: :btree
  end

  create_table "fin_line_items", force: :cascade do |t|
    t.integer  "financial_statement_id",                null: false
    t.string   "name",                                  null: false
    t.integer  "function_id"
    t.boolean  "revenue",                default: true, null: false
    t.datetime "created_at",                            null: false
    t.datetime "updated_at",                            null: false
    t.index ["financial_statement_id"], name: "index_fin_line_items_on_financial_statement_id", using: :btree
    t.index ["function_id"], name: "index_fin_line_items_on_function_id", using: :btree
    t.index ["name"], name: "index_fin_line_items_on_name", using: :btree
  end

  create_table "financial_statements", force: :cascade do |t|
    t.integer  "version_id", null: false
    t.string   "type",       null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["type"], name: "index_financial_statements_on_type", using: :btree
    t.index ["version_id"], name: "index_financial_statements_on_version_id", using: :btree
  end

  create_table "functions", force: :cascade do |t|
    t.integer  "version_id", null: false
    t.string   "name",       null: false
    t.string   "function",   null: false
    t.numrange "parA"
    t.numrange "parB"
    t.numrange "parC"
    t.numrange "parD"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["name"], name: "index_functions_on_name", using: :btree
    t.index ["version_id"], name: "index_functions_on_version_id", using: :btree
  end

  create_table "games", force: :cascade do |t|
    t.integer  "version_id",                                           null: false
    t.integer  "first_month_id"
    t.integer  "starting_year"
    t.integer  "duration",           limit: 2
    t.integer  "func_changeover_id"
    t.integer  "trainExtraAvail",    limit: 2
    t.decimal  "illPer",                       precision: 3, scale: 2
    t.date     "autodelete"
    t.integer  "current_quarter",    limit: 2
    t.datetime "created_at",                                           null: false
    t.datetime "updated_at",                                           null: false
    t.index ["version_id"], name: "index_games_on_version_id", using: :btree
  end

  create_table "goals", force: :cascade do |t|
    t.integer  "version_id", null: false
    t.string   "name",       null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["version_id"], name: "index_goals_on_version_id", using: :btree
  end

  create_table "health_conts", force: :cascade do |t|
    t.integer  "health_id",    null: false
    t.integer  "continent_id", null: false
    t.integer  "CPP"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
    t.index ["continent_id"], name: "index_health_conts_on_continent_id", using: :btree
    t.index ["health_id", "continent_id"], name: "index_health_conts_on_health_id_and_continent_id", unique: true, using: :btree
    t.index ["health_id"], name: "index_health_conts_on_health_id", using: :btree
  end

  create_table "healths", force: :cascade do |t|
    t.integer  "version_id", null: false
    t.string   "name",       null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["name"], name: "index_healths_on_name", using: :btree
    t.index ["version_id"], name: "index_healths_on_version_id", using: :btree
  end

  create_table "interests", force: :cascade do |t|
    t.integer  "function_id"
    t.string   "type",                                null: false
    t.decimal  "interest",    precision: 3, scale: 2
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
    t.index ["function_id"], name: "index_interests_on_function_id", using: :btree
  end

  create_table "loans", force: :cascade do |t|
    t.integer  "interest_id",                   null: false
    t.string   "type",                          null: false
    t.boolean  "shares_danger", default: false, null: false
    t.datetime "created_at",                    null: false
    t.datetime "updated_at",                    null: false
    t.index ["interest_id"], name: "index_loans_on_interest_id", using: :btree
  end

  create_table "months", force: :cascade do |t|
    t.integer  "version_id",                                        null: false
    t.integer  "no"
    t.string   "name",                                              null: false
    t.integer  "noDays",                               default: 30, null: false
    t.decimal  "seasonPer",    precision: 3, scale: 2
    t.integer  "firstDayNo"
    t.string   "firstDayName"
    t.datetime "created_at",                                        null: false
    t.datetime "updated_at",                                        null: false
    t.index ["name"], name: "index_months_on_name", using: :btree
    t.index ["noDays"], name: "index_months_on_noDays", using: :btree
    t.index ["version_id"], name: "index_months_on_version_id", using: :btree
  end

  create_table "mqs", force: :cascade do |t|
    t.integer  "month_id",   null: false
    t.integer  "quarter_id", null: false
    t.numrange "demandP"
    t.integer  "demandS"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["month_id", "quarter_id"], name: "index_mqs_on_month_id_and_quarter_id", unique: true, using: :btree
    t.index ["month_id"], name: "index_mqs_on_month_id", using: :btree
    t.index ["quarter_id"], name: "index_mqs_on_quarter_id", using: :btree
  end

  create_table "need_custs", force: :cascade do |t|
    t.integer  "need_id",                                               null: false
    t.integer  "customer_id",                                           null: false
    t.binary   "interest",                            default: "10000"
    t.binary   "subI2",                               default: "0"
    t.binary   "subI4",                               default: "0"
    t.decimal  "score",       precision: 3, scale: 2
    t.datetime "created_at",                                            null: false
    t.datetime "updated_at",                                            null: false
    t.index ["customer_id"], name: "index_need_custs_on_customer_id", using: :btree
    t.index ["need_id", "customer_id"], name: "index_need_custs_on_need_id_and_customer_id", unique: true, using: :btree
    t.index ["need_id"], name: "index_need_custs_on_need_id", using: :btree
  end

  create_table "need_prod_chars", force: :cascade do |t|
    t.integer  "need_id",      null: false
    t.integer  "prod_char_id", null: false
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
    t.index ["need_id"], name: "index_need_prod_chars_on_need_id", using: :btree
    t.index ["prod_char_id"], name: "index_need_prod_chars_on_prod_char_id", using: :btree
  end

  create_table "need_scores", force: :cascade do |t|
    t.integer  "need_id",                            null: false
    t.integer  "score_id",                           null: false
    t.decimal  "weight",     precision: 3, scale: 2
    t.datetime "created_at",                         null: false
    t.datetime "updated_at",                         null: false
    t.index ["need_id"], name: "index_need_scores_on_need_id", using: :btree
    t.index ["score_id"], name: "index_need_scores_on_score_id", using: :btree
  end

  create_table "need_types", force: :cascade do |t|
    t.integer  "version_id", null: false
    t.string   "name",       null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["name"], name: "index_need_types_on_name", using: :btree
    t.index ["version_id"], name: "index_need_types_on_version_id", using: :btree
  end

  create_table "needs", force: :cascade do |t|
    t.integer  "need_type_id", null: false
    t.string   "name",         null: false
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
    t.index ["name"], name: "index_needs_on_name", using: :btree
    t.index ["need_type_id"], name: "index_needs_on_need_type_id", using: :btree
  end

  create_table "prod_chars", force: :cascade do |t|
    t.integer  "category_prod_id",                       null: false
    t.string   "name",                                   null: false
    t.integer  "avail",            limit: 2, default: 1, null: false
    t.integer  "cost",                                   null: false
    t.integer  "initC",                      default: 0
    t.integer  "discount_id"
    t.integer  "scale"
    t.integer  "LifeE"
    t.integer  "malfPerE"
    t.datetime "created_at",                             null: false
    t.datetime "updated_at",                             null: false
    t.index ["avail"], name: "index_prod_chars_on_avail", using: :btree
    t.index ["category_prod_id", "scale"], name: "index_prod_chars_on_category_prod_id_and_scale", unique: true, using: :btree
    t.index ["category_prod_id"], name: "index_prod_chars_on_category_prod_id", using: :btree
    t.index ["name"], name: "index_prod_chars_on_name", using: :btree
  end

  create_table "quarters", force: :cascade do |t|
    t.integer  "game_id",                                    null: false
    t.integer  "q_no",                                       null: false
    t.integer  "func_demand_id"
    t.decimal  "parA"
    t.decimal  "parB"
    t.decimal  "parC"
    t.decimal  "parD"
    t.decimal  "rangeDemandPer",     precision: 3, scale: 2
    t.integer  "funding_amount_max"
    t.datetime "created_at",                                 null: false
    t.datetime "updated_at",                                 null: false
    t.index ["game_id", "q_no"], name: "index_quarters_on_game_id_and_q_no", unique: true, using: :btree
    t.index ["game_id"], name: "index_quarters_on_game_id", using: :btree
    t.index ["q_no"], name: "index_quarters_on_q_no", using: :btree
  end

  create_table "roles", force: :cascade do |t|
    t.string   "name",       null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["name"], name: "index_roles_on_name", using: :btree
  end

  create_table "scores", force: :cascade do |t|
    t.integer  "version_id",  null: false
    t.string   "name",        null: false
    t.integer  "function_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.index ["function_id"], name: "index_scores_on_function_id", using: :btree
    t.index ["name"], name: "index_scores_on_name", using: :btree
    t.index ["version_id"], name: "index_scores_on_version_id", using: :btree
  end

  create_table "transfer_costs", force: :cascade do |t|
    t.integer  "name1_id",    null: false
    t.integer  "name2_id",    null: false
    t.integer  "function_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.index ["function_id"], name: "index_transfer_costs_on_function_id", using: :btree
    t.index ["name1_id", "name2_id"], name: "index_transfer_costs_on_name1_id_and_name2_id", unique: true, using: :btree
  end

  create_table "users", force: :cascade do |t|
    t.integer  "role_id",                            null: false
    t.string   "username"
    t.string   "first_name",                         null: false
    t.string   "middle_name"
    t.string   "last_name",                          null: false
    t.datetime "created_at",                         null: false
    t.datetime "updated_at",                         null: false
    t.string   "email",                              null: false
    t.string   "encrypted_password",                 null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0, null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet     "current_sign_in_ip"
    t.inet     "last_sign_in_ip"
    t.string   "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.boolean  "locked"
    t.string   "unlock_token"
    t.datetime "locked_at"
    t.index ["last_name"], name: "index_users_on_last_name", using: :btree
    t.index ["role_id"], name: "index_users_on_role_id", using: :btree
    t.index ["username"], name: "index_users_on_username", using: :btree
  end

  create_table "versions", force: :cascade do |t|
    t.decimal  "rangeDemandMax",                    precision: 3, scale: 2
    t.integer  "adv_lines_max"
    t.integer  "funding_amount_default"
    t.integer  "funding_amount_duration", limit: 2,                         default: 5
    t.numrange "ill_percent_range"
    t.datetime "created_at",                                                            null: false
    t.datetime "updated_at",                                                            null: false
  end

  create_table "web_features", force: :cascade do |t|
    t.integer  "version_id", null: false
    t.string   "name",       null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["version_id"], name: "index_web_features_on_version_id", using: :btree
  end

  create_table "web_supplies", force: :cascade do |t|
    t.integer  "web_feature_id",           null: false
    t.integer  "continent_id",             null: false
    t.integer  "initC"
    t.integer  "supplyWebPS",    limit: 2
    t.datetime "created_at",               null: false
    t.datetime "updated_at",               null: false
    t.index ["continent_id"], name: "index_web_supplies_on_continent_id", using: :btree
    t.index ["web_feature_id", "continent_id"], name: "index_web_supplies_on_web_feature_id_and_continent_id", unique: true, using: :btree
    t.index ["web_feature_id"], name: "index_web_supplies_on_web_feature_id", using: :btree
  end

  add_foreign_key "adv_chars", "category_advs"
  add_foreign_key "adv_chars", "functions"
  add_foreign_key "adv_chars", "prod_chars"
  add_foreign_key "adv_media", "versions"
  add_foreign_key "category_advs", "versions"
  add_foreign_key "category_prods", "versions"
  add_foreign_key "chat_gs", "games"
  add_foreign_key "chat_lines", "chat_gs"
  add_foreign_key "chat_users", "chat_gs"
  add_foreign_key "chat_users", "users"
  add_foreign_key "cities", "continents"
  add_foreign_key "comp_adv_chars", "adv_chars"
  add_foreign_key "comp_adv_chars", "comp_advs"
  add_foreign_key "comp_adv_q_cities", "cities"
  add_foreign_key "comp_adv_q_cities", "comp_adv_qs"
  add_foreign_key "comp_adv_q_media", "adv_media"
  add_foreign_key "comp_adv_q_media", "comp_adv_qs"
  add_foreign_key "comp_adv_qs", "comp_advs"
  add_foreign_key "comp_adv_qs", "quarters"
  add_foreign_key "comp_advs", "comp_qs"
  add_foreign_key "comp_advs", "quarters", column: "q_end_id"
  add_foreign_key "comp_goals", "companies"
  add_foreign_key "comp_goals", "goals"
  add_foreign_key "comp_prod_adv_custs", "comp_advs"
  add_foreign_key "comp_prod_adv_custs", "comp_prods"
  add_foreign_key "comp_prod_adv_custs", "customers"
  add_foreign_key "comp_prod_advs", "comp_advs"
  add_foreign_key "comp_prod_advs", "comp_prods"
  add_foreign_key "comp_prod_chars", "comp_qs"
  add_foreign_key "comp_prod_chars", "prod_chars"
  add_foreign_key "comp_prod_custs", "comp_prods"
  add_foreign_key "comp_prod_custs", "customers"
  add_foreign_key "comp_prod_mq_cust_cities", "comp_prod_q_cust_cities"
  add_foreign_key "comp_prod_mq_cust_cities", "mqs"
  add_foreign_key "comp_prod_q_cities", "cities"
  add_foreign_key "comp_prod_q_cities", "comp_prod_qs"
  add_foreign_key "comp_prod_q_cust_cities", "comp_prods"
  add_foreign_key "comp_prod_q_cust_cities", "comp_q_cust_cities"
  add_foreign_key "comp_prod_q_stores", "comp_prod_qs"
  add_foreign_key "comp_prod_q_stores", "comp_q_stores"
  add_foreign_key "comp_prod_q_webs", "comp_prod_qs"
  add_foreign_key "comp_prod_q_webs", "comp_q_webs"
  add_foreign_key "comp_prod_qs", "comp_prods"
  add_foreign_key "comp_prod_qs", "quarters"
  add_foreign_key "comp_prods", "comp_qs"
  add_foreign_key "comp_prods", "quarters", column: "q_end_id"
  add_foreign_key "comp_q_cust_cities", "comp_qs"
  add_foreign_key "comp_q_cust_cities", "cust_cities"
  add_foreign_key "comp_q_educs", "comp_qs"
  add_foreign_key "comp_q_educs", "educations"
  add_foreign_key "comp_q_fins", "comp_qs"
  add_foreign_key "comp_q_fins", "fin_line_items"
  add_foreign_key "comp_q_loans", "comp_qs"
  add_foreign_key "comp_q_loans", "loans"
  add_foreign_key "comp_q_priors", "comp_qs"
  add_foreign_key "comp_q_priors", "customers"
  add_foreign_key "comp_q_scores", "comp_qs"
  add_foreign_key "comp_q_scores", "scores"
  add_foreign_key "comp_q_searches", "comp_qs"
  add_foreign_key "comp_q_searches", "continents"
  add_foreign_key "comp_q_store_custs", "comp_q_stores"
  add_foreign_key "comp_q_store_custs", "customers"
  add_foreign_key "comp_q_stores", "cities"
  add_foreign_key "comp_q_stores", "comp_qs"
  add_foreign_key "comp_q_web_supplies", "comp_q_webs"
  add_foreign_key "comp_q_web_supplies", "web_supplies"
  add_foreign_key "comp_q_webs", "comp_qs"
  add_foreign_key "comp_q_webs", "continents"
  add_foreign_key "comp_qs", "companies"
  add_foreign_key "comp_qs", "healths", column: "insurance_e_id"
  add_foreign_key "comp_qs", "healths", column: "insurance_w_id"
  add_foreign_key "comp_qs", "quarters"
  add_foreign_key "comp_rnds", "companies", column: "buyer_id"
  add_foreign_key "comp_rnds", "companies", column: "seller_id"
  add_foreign_key "comp_rnds", "prod_chars", column: "prod_id"
  add_foreign_key "comp_rnds", "quarters"
  add_foreign_key "comp_rnds", "quarters", column: "quarterO_id"
  add_foreign_key "comp_users", "companies"
  add_foreign_key "comp_users", "users"
  add_foreign_key "companies", "continents"
  add_foreign_key "companies", "games"
  add_foreign_key "companies", "users", column: "ceo_id"
  add_foreign_key "continents", "healths", column: "health_e_id"
  add_foreign_key "continents", "healths", column: "health_w_id"
  add_foreign_key "continents", "versions"
  add_foreign_key "cust_adv_chars", "adv_chars"
  add_foreign_key "cust_adv_chars", "customers"
  add_foreign_key "cust_adv_media", "adv_media"
  add_foreign_key "cust_adv_media", "customers"
  add_foreign_key "cust_category_advs", "category_advs"
  add_foreign_key "cust_category_advs", "customers"
  add_foreign_key "cust_category_prods", "category_prods"
  add_foreign_key "cust_category_prods", "customers"
  add_foreign_key "cust_cities", "cities"
  add_foreign_key "cust_cities", "customers"
  add_foreign_key "cust_funcs", "customers"
  add_foreign_key "cust_funcs", "functions"
  add_foreign_key "cust_g_funcs", "cust_funcs"
  add_foreign_key "cust_g_funcs", "games"
  add_foreign_key "cust_g_mq_cities", "cust_cities"
  add_foreign_key "cust_g_mq_cities", "mqs"
  add_foreign_key "cust_gs", "customers"
  add_foreign_key "cust_gs", "games"
  add_foreign_key "cust_prod_chars", "customers"
  add_foreign_key "cust_prod_chars", "prod_chars"
  add_foreign_key "customers", "functions", column: "a_appear_city_id"
  add_foreign_key "customers", "functions", column: "a_appear_media_id"
  add_foreign_key "customers", "functions", column: "func_price_id"
  add_foreign_key "customers", "versions"
  add_foreign_key "educations", "versions"
  add_foreign_key "factory_capacities", "versions"
  add_foreign_key "fin_line_items", "financial_statements"
  add_foreign_key "fin_line_items", "functions"
  add_foreign_key "financial_statements", "versions"
  add_foreign_key "functions", "versions"
  add_foreign_key "games", "functions", column: "func_changeover_id"
  add_foreign_key "games", "months", column: "first_month_id"
  add_foreign_key "games", "versions"
  add_foreign_key "goals", "versions"
  add_foreign_key "health_conts", "continents"
  add_foreign_key "health_conts", "healths"
  add_foreign_key "healths", "versions"
  add_foreign_key "interests", "functions"
  add_foreign_key "loans", "interests"
  add_foreign_key "months", "versions"
  add_foreign_key "mqs", "months"
  add_foreign_key "mqs", "quarters"
  add_foreign_key "need_custs", "customers"
  add_foreign_key "need_custs", "needs"
  add_foreign_key "need_prod_chars", "needs"
  add_foreign_key "need_prod_chars", "prod_chars"
  add_foreign_key "need_scores", "needs"
  add_foreign_key "need_scores", "scores"
  add_foreign_key "need_types", "versions"
  add_foreign_key "needs", "need_types"
  add_foreign_key "prod_chars", "category_prods"
  add_foreign_key "prod_chars", "functions", column: "discount_id"
  add_foreign_key "quarters", "functions", column: "func_demand_id"
  add_foreign_key "quarters", "games"
  add_foreign_key "scores", "functions"
  add_foreign_key "scores", "versions"
  add_foreign_key "transfer_costs", "continents", column: "name1_id"
  add_foreign_key "transfer_costs", "continents", column: "name2_id"
  add_foreign_key "transfer_costs", "functions"
  add_foreign_key "users", "roles"
  add_foreign_key "web_features", "versions"
  add_foreign_key "web_supplies", "continents"
  add_foreign_key "web_supplies", "web_features"
end
