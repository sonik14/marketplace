class CreateCompProdAdvs < ActiveRecord::Migration[5.0]
  def change
    create_table :comp_prod_advs do |t|

      t.belongs_to :comp_prod, foreign_key: true #when null it means that this adv is not connected to that product =? always falseAdv=false
      t.belongs_to :comp_adv, foreign_key: true, null: false

      t.boolean :falseAdv, default: false
      #when true the advertisment is false and if issued by other User, a penalty must be paid
      t.timestamps
    end
    add_index :comp_prod_advs, [:comp_prod_id, :comp_adv_id], unique: true
  end
end
