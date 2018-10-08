class CustG < ApplicationRecord
  	belongs_to :customer
  	belongs_to :game

  	validates :game, uniqueness: {scope: :customer}, presence: true
	validates :rebuyPer, numericality: true, allow_nil: true
	validates :rebuyInterval, numericality: true, allow_nil: true
	validates :A1_prod_char_SI, numericality: true, allow_nil: true
	validates :A2_adv_char_SI, numericality: true, allow_nil: true
	validates :A3_price_SI, numericality: true, allow_nil: true
	validates :A4_quality_SI, numericality: true, allow_nil: true

  	before_save :customer_save

	private
		def customer_save
		  	cust = Customer.find(self.customer_id)
		  	scale = (10 ** cust.scales)
		  	decimals = cust.scales - 2
		    step = 1.0/scale * 100
		    cust.rebuyRmin = cust.rebuyRmin * scale unless cust.rebuyRmin.nil?
		    cust.rebuyRmax = cust.rebuyRmax * scale unless cust.rebuyRmax.nil?
		    cust.rebuyIntervalmin = cust.rebuyIntervalmin unless cust.rebuyIntervalmin.nil?
		    cust.rebuyIntervalmax = cust.rebuyIntervalmax unless cust.rebuyIntervalmax.nil?
		    if cust.rebuyIntervalmax.nil?
		    	cust.rebuyIntervalmax = Game.find(self.game_id).duration + 1
		    end
		    cust.A1_prod_char_SI_min = cust.A1_prod_char_SI_min * scale
		    cust.A1_prod_char_SI_max = cust.A1_prod_char_SI_max * scale
		    cust.A2_adv_char_SI_min = cust.A2_adv_char_SI_min * scale
		    cust.A2_adv_char_SI_max = cust.A2_adv_char_SI_max * scale
		    cust.A3_price_SI_min = cust.A3_price_SI_min * scale
		    cust.A3_price_SI_max = cust.A3_price_SI_max * scale
		    cust.A4_quality_SI_min = cust.A4_quality_SI_min * scale
		    cust.A4_quality_SI_max = cust.A4_quality_SI_max * scale

	        if self.rebuyPer.nil?
          		self.rebuyPer = step * rand(cust.rebuyRmin..cust.rebuyRmax)
	        else
				self.rebuyPer = self.rebuyPer.round(decimals)
				if self.rebuyPer > cust.rebuyRmax
					self.rebuyPer = cust.rebuyRmax
				elsif self.rebuyPer < cust.rebuyRmin
					self.rebuyPer = cust.rebuyRmin
				end
	        end
	        if self.rebuyInterval.nil?
          		self.rebuyInterval = rand(cust.rebuyIntervalmin..cust.rebuyIntervalmax)
	        else
				self.rebuyInterval = self.rebuyInterval.round(0)
				if self.rebuyInterval > cust.rebuyIntervalmax
					self.rebuyInterval = cust.rebuyIntervalmax
				elsif self.rebuyInterval < cust.rebuyIntervalmin
					self.rebuyInterval = cust.rebuyIntervalmin
				end
	        end
	        if self.A1_prod_char_SI.nil?
          		self.A1_prod_char_SI = step * rand(cust.A1_prod_char_SI_min..cust.A1_prod_char_SI_max)
	        else
				self.A1_prod_char_SI = self.A1_prod_char_SI.round(decimals)
				if self.A1_prod_char_SI > cust.A1_prod_char_SI_max
					self.A1_prod_char_SI = cust.A1_prod_char_SI_max
				elsif self.A1_prod_char_SI < cust.A1_prod_char_SI_min
					self.A1_prod_char_SI = cust.A1_prod_char_SI_min
				end
	        end
	        if self.A2_adv_char_SI.nil?
          		self.A2_adv_char_SI = step * rand(cust.A2_adv_char_SI_min..cust.A2_adv_char_SI_max)
	        else
				self.A2_adv_char_SI = self.A2_adv_char_SI.round(decimals)
				if self.A2_adv_char_SI > cust.A2_adv_char_SI_max
					self.A2_adv_char_SI = cust.A2_adv_char_SI_max
				elsif self.A2_adv_char_SI < cust.A2_adv_char_SI_min
					self.A2_adv_char_SI = cust.A2_adv_char_SI_min
				end
	        end
	        if self.A3_price_SI.nil?
          		self.A3_price_SI = step * rand(cust.A3_price_SI_min..cust.A3_price_SI_max)
	        else
				self.A3_price_SI = self.A3_price_SI.round(decimals)
				if self.A3_price_SI > cust.A3_price_SI_max
					self.A3_price_SI = cust.A3_price_SI_max
				elsif self.A3_price_SI < cust.A3_price_SI_min
					self.A3_price_SI = cust.A3_price_SI_min
				end
	        end
		  	self.A4_quality_SI = (100-self.A1_prod_char_SI-self.A2_adv_char_SI-self.A3_price_SI).round(cust.scales-2)
		end
end
