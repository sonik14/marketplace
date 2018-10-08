class CreateCustCategoryProds < ActiveRecord::Migration[5.0]
  def change
    create_table :cust_category_prods do |t|

      t.belongs_to :category_prod, foreign_key: true, null: false
      t.belongs_to :customer, foreign_key: true, null: false

      t.integer :charsWantedNo, unsigned: true # less than M of course and if multiple is true
      t.decimal :charsWantedNoSΙ, unsigned: true, precision: 3, scale: 2
      # how sensitive the user is if less or more characteristics of this category exist in a product
      t.boolean :acceptBetter, null: false, default: :true
      # if comparable is true =>
      # {
      # 	if acceptBetter is false =>
 	  # 	characteristic either better or worse => influences negatively.
 	  # 	else acceptBetter is true
      # 	(if characteristic better => not affect, else worse => influences negatively).
      # }

      t.timestamps
    end
    add_index :cust_category_prods, [:category_prod_id, :customer_id], unique: true
  end
end
