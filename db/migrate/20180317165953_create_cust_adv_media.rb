class CreateCustAdvMedia < ActiveRecord::Migration[5.0]
  def change
    create_table :cust_adv_media do |t|

      t.belongs_to :adv_medium, foreign_key: true, null: false
      t.belongs_to :customer, foreign_key: true, null: false
      t.numrange :range, unsigned: true
      # Διαβάθμιση για κάθε τύπο καταναλωτή σε decimal.
      # ΠΧ 0-40 για σπορτς. 40-41 για οικονομικά, 41-75 κουτσομπολίστικα
      # με άθροισμα 100 για κάθε τύπο όταν έχουν αντιστοιχιστεί όλα τα media.
      t.decimal :interest, unsigned: true, precision: 3, scale: 2
      # interest is extracted by the previous range (so it can be omitted)
      # (max-min)/100 (As a percent)
      t.timestamps
    end
    add_index :cust_adv_media, [:adv_medium_id, :customer_id], unique: true
  end
end
