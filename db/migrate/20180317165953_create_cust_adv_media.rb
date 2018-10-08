class CreateCustAdvMedia < ActiveRecord::Migration[5.0]
  def change
    create_table :cust_adv_media do |t|

      t.belongs_to :adv_medium, foreign_key: true, null: false
      t.belongs_to :customer, foreign_key: true, null: false

      t.decimal    :shareRmin, unsigned: true, precision: 5, scale: 4
      t.decimal    :shareRmax, unsigned: true, precision: 5, scale: 4
      # Diavathmisi gia kathe typo katanalwth se decimal.
      # Px: 0-40 gia sports, 40-41 oikonomika, 41-75 koutsompolistika
      # me athroisma 100 gia kathe typo otan exoun antistoixistei ola ta media.
      t.decimal :interest, unsigned: true, precision: 3, scale: 2
      # interest is extracted by the previous range (so it can be omitted)
      # (max-min)/100 (As a percent)
      t.timestamps
    end
    add_index :cust_adv_media, [:adv_medium_id, :customer_id], unique: true
  end
end
