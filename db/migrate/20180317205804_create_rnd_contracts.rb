class CreateRndContracts < ActiveRecord::Migration[5.0]
  ## to be deleted (no usability anymore)
  #def change
  #  create_table :rnd_contracts do |t|

   #   t.belongs_to :company, foreign_key: true
   #   t.belongs_to :prod_char, foreign_key: true
   #   t.integer :quarterO, unsigned: true, limit: 1 #in possesion (mipws kalutera me foreign key sto symvolaio agoras?)
      # t.integer :provider, default: NULL
   #   t.timestamps
   # end
    #add_foreign_key :comp_rnd_buys, :comp_rnd_buys, column: :provider
   # add_index :comp_rnds, [:company_id, :prod_char_id], unique: true
  #end
end
