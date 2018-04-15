class CreateCompProdCharCusts < ActiveRecord::Migration[5.0]
## it is ommited since it is just maths calculations that can be done on running time
#  def change
#    create_table :comp_prod_char_custs do |t|
#
#      t.belongs_to :comp_prod, foreign_key: true, null: false
#      t.belongs_to :cust_prod_char, foreign_key: true, null: false
#
#      t.decimal :n, unsigned: true, precision: 3, scale: 2 #|scale(prod_char)-scale(comp_q_prod_char)| (see Tsoukalas Thesis)
#      t.decimal :c, unsigned: true, precision: 3, scale: 2 #1-n/m(prod_category του prod_char (see Tsoukalas Thesis) [m exists in cust_prod_char]
#
#      t.timestamps
#    end
#     add_index :comp_prod_char_custs, [:comp_prod_id, :cust_prod_char_id], unique: true
#  end
end
