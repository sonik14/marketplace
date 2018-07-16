class CreateCustomers < ActiveRecord::Migration[5.0]
  def change
    create_table :customers do |t|

      t.belongs_to :version, foreign_key: true, null: false

      t.string  :name, unique: true, index: true, null: false
      t.string  :alt
      t.text    :description
      #changed from type to name for better compatibility (for instance: active admin needs name for better representation in admin panel)
      t.decimal :marketsize_total, unsigned: true, precision: 3, scale: 2 #not equally distributed per city
      #if werknemers are 20% of customers it does not mean that the 20% of Athens customers will be werknemers
      t.decimal :purchaseRmin, unsigned: true, precision: 3, scale: 2
      t.decimal :purchaseRmax, unsigned: true, precision: 3, scale: 2
      t.decimal :revisitRmin, unsigned: true, precision: 3, scale: 2
      t.decimal :revisitRmax, unsigned: true, precision: 3, scale: 2
      t.decimal :rebuyRmin, unsigned: true, precision: 3, scale: 2
      t.decimal :rebuyRmax, unsigned: true, precision: 3, scale: 2
      # the range in the percentage of the customer who will buy again within the rebuyInterval period
      t.integer :rebuyIntervalmin, unsigned: true
      t.integer :rebuyIntervalmax, unsigned: true
      # within these amount of quarters, we take rebuyers into consideration
      # we take that number as the middle part of the distribution the rebuy will have.
      t.integer :rebuyPar, limit: 1
      # values: [-5, 5], -5 => next buy will be different kind of computer
      # 0 => next buy product type is indifferent to previous buys
      # 5 => 100% again the same product type as the first buy
      # example: -5 => if he first buys laptop, then he buys something else except laptop.
      # 5 => if he buys laptop, then he buys again laptop every time.

      # PRODUCT AND ADVERTISMENT RATING -------------------------

      t.decimal :A1_prod_char_SI, unsigned: true, precision: 3, scale: 2 #3 #weight, sensitivity
      t.decimal :A2_adv_char_SI, unsigned: true, precision: 3, scale: 2 #2
      t.decimal :A3_price_SI, unsigned: true, precision: 3, scale: 2 #1
      t.decimal :A4_quality_SI, unsigned: true, precision: 3, scale: 2 #0 #sum 1
      # 3 apla ypodeiknuei an tha psaksw ston need_prod_char
      # 2 vlepoume an tha psaksw sto subweight2
      # 0 omoiws subweight4

      #subweight2:
      t.decimal :a_generalI, unsigned: true, precision: 3, scale: 2 
      t.decimal :a_prod_nameI, unsigned: true, precision: 3, scale: 2 #if name of product exists in adv
      t.decimal :a_char_orderI, unsigned: true, precision: 3, scale: 2 
      #how much ordering of chars in adv influences.
      #This happens for example when customer pays attention only to first ones.

      t.integer :priceLow # lowest price each customer will pay if needed to prevent unfair competition

      #subweight4:
      # this (without R) counts only in case of first Buy (major issues)
      t.decimal :q_D1ReliabilitySI, unsigned: true, precision: 3, scale: 2 #interest 0.00-1.00 (100 percent)
      # this (R) counts only in case of Rebuy (because personal experience matters)
      t.decimal :q_D1ReliabilityRSI, unsigned: true, precision: 3, scale: 2

      t.decimal :q_D2ReputationSI, unsigned: true, precision: 3, scale: 2 
      t.decimal :q_D3RealAdvSI, precision: 3, scale: 2
      t.decimal :q_D4DiscountSI, precision: 3, scale: 2

      # --------------------------------------------------------

      t.integer :adv_lines_no, unsigned: true
      # how many lines this customer would like to exist in an adv
      t.decimal :adv_lines_no_S, unsigned: true, precision: 3, scale: 2
      # how sensitive the user is if less or more advertisment lines exist in an adv
      t.decimal :advMediaI, unsigned: true, precision: 3, scale: 2 
      t.decimal :advCityI, unsigned: true, precision: 3, scale: 2
      # the sum of these 2 is 1
      t.integer  :a_appear_media_id

      t.timestamps
    end
  end
end
