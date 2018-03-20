class CreateCompProdChars < ActiveRecord::Migration[5.0]
  def change
    create_table :comp_prod_chars do |t|

      t.timestamps
    end
  end
end
