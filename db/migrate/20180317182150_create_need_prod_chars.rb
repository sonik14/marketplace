class CreateNeedProdChars < ActiveRecord::Migration[5.0]
  def change
    create_table :need_prod_chars do |t|

      t.timestamps
    end
  end
end
