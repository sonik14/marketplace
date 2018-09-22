class CreateFunctionUsages < ActiveRecord::Migration[5.0]
  def change
    create_table :function_usages do |t|
      t.belongs_to :version, foreign_key: true, null: false

      t.string :name, null: false
      t.boolean :fixedPars, null: false, default: false # false when admin can modify parameters
      t.boolean :differentEachCust, null: false, default: false # true when each customer follows different function
      t.boolean :differentEachQ, null: false, default: false # true when admin can change it each quarter

      t.timestamps
    end
    add_index :function_usages, [:version_id, :name], unique: true
  end
end

=begin
usages for game:
pricing (differentEachCust: true)
demand (differentEachQ: true)
changeover (fixedPars: true)
discount id for RnD prod_chars (y: RnD, x: time) (fixedPars: true)
appearances influence for advertisments in cities (differentEachCust: true,fixedPars: true)
appearances influence for advertisments in media (differentEachCust: true, fixedPars: true)
has_many :scores (fixedPars: true)
has_many :adv_chars (fixedPars: true)
has_many :cust_funcs (fixedPars: true)
has_many :interests (fixedPars: true)
has_many :fin_line_items (fixedPars: true)
has_many :transfer_costs (fixedPars: true)

if (fixedPars: false)
	if (differentEachCust: false and differentEachQ: false)
		function_g
	else if (differentEachCust: true and differentEachQ: false)
		cust_g_func
	else if (differentEachCust: true and differentEachQ: true)
		cust_q_func
	else
		function_q
else
	only in functions or foreign keys to other tables (same for each game)

in the beggining of each game create an entry either in g_func or in cust_g_funcs
=end
