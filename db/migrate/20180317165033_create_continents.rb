class CreateContinents < ActiveRecord::Migration[5.0]
  def change
    create_table :continents do |t|

      t.belongs_to :version, foreign_key: true, null: false

      t.string :name, index: true, null: false
      t.string :factoryCityName
      t.decimal :salaryWI, unsigned: true, precision: 3, scale: 2
      t.integer :salaryWC, unsigned: true
      t.decimal :healthWI, unsigned: true, precision: 3, scale: 2
      t.integer :health_w_id, null: false #sto health gia ton proepilegmeno typo. to health_cont perilamvanei to kostos kathe health gia kathe hpeiro
      t.decimal :vacationWI, unsigned: true, precision: 3, scale: 2
      t.integer :vacationWW, unsigned: true, limit: 1 #weeks
      t.integer :vacationWC, unsigned: true
      t.decimal :pensionWI, unsigned: true, precision: 3, scale: 2
      t.decimal :pensionWPer, unsigned: true, precision: 3, scale: 2 #percent 0.00-1.00
      t.integer :pensionWC, unsigned: true

      #sto cities an h timh diaforetikh ana polh sthn idia hpeiro
      t.decimal :salaryEI, unsigned: true, precision: 3, scale: 2
      t.integer :salaryED, unsigned: true
      t.decimal :healthEI, unsigned: true, precision: 3, scale: 2
      t.integer :health_e_id, null: false
      t.decimal :vacationEI, unsigned: true, precision: 3, scale: 2
      t.integer :vacationDI, unsigned: true, limit: 1 #weeks
      t.decimal :pensionEI, unsigned: true, precision: 3, scale: 2
      t.decimal :pensionDI, unsigned: true, precision: 3, scale: 2 #percent 0.00-1.00

      t.integer :researchC, unsigned: true


      #sto cities an h timh diaforetikh ana polh sthn idia hpeiro
      t.integer :storeSetupC, unsigned: true
      t.integer :storeClosureC, unsigned: true
      t.integer :storeLeaseC, unsigned: true
      t.integer :hireEC, unsigned: true
      t.integer :dismissEC, unsigned: true

      t.integer :webSetupC, unsigned: true
      t.integer :webClosureC, unsigned: true
      t.integer :webLeaseC, unsigned: true
      t.timestamps
    end
    add_index :continents, [:version_id, :name], unique: true
    add_foreign_key :continents, :healths, column: :health_w_id
    add_foreign_key :continents, :healths, column: :health_e_id
  end
end
