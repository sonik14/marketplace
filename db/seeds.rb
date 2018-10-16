# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
Role.create!(name: 'admin') if Rails.env.development?
Role.create!(name: 'moderator') if Rails.env.development?
Role.create!(name: 'ceo') if Rails.env.development?
Role.create!(name: 'user') if Rails.env.development?
User.create!(role_id: '1', first_name: 'Test', last_name: 'Admin', email: 'admin@example.com', password: 'password', password_confirmation: 'password') if Rails.env.development?
User.create!(role_id: '2', first_name: 'Test', last_name: 'Moderator', email: 'moderator@example.com', password: 'password', password_confirmation: 'password') if Rails.env.development?
User.create!(role_id: '3', first_name: 'Test', last_name: 'Ceo', email: 'ceo1@example.com', password: 'password', password_confirmation: 'password') if Rails.env.development?
User.create!(role_id: '3', first_name: 'Test', last_name: 'Ceo', email: 'ceo2@example.com', password: 'password', password_confirmation: 'password') if Rails.env.development?
User.create!(role_id: '4', first_name: 'Test', last_name: 'User', email: 'user1@example.com', password: 'password', password_confirmation: 'password') if Rails.env.development?
User.create!(role_id: '4', first_name: 'Test', last_name: 'User', email: 'user2@example.com', password: 'password', password_confirmation: 'password') if Rails.env.development?
Version.create!(mainNo: '1', name: '1.0.0', rangeDemandMin: '0.01', rangeDemandMax: '0.1', adv_lines_max: '10', funding_amount_default: '5000000', funding_amount_duration: '5', illPerRmin: '0.15', illPerRmax: '0.50', durationMin: '6', durationMax: '20', durationDef: '10') if Rails.env.development?

Health.create!(version_id: '1', name: 'basic') if Rails.env.development?
Health.create!(version_id: '1', name: 'full') if Rails.env.development?
Continent.create!(version_id: '1', name: 'America', factoryCityName: 'Ensenada', health_w_id: '1', health_e_id: '1') if Rails.env.development?
Continent.create!(version_id: '1', name: 'Europe-Africa EA', factoryCityName: 'Kiev', health_w_id: '1', health_e_id: '1') if Rails.env.development?
Continent.create!(version_id: '1', name: 'Asia-Pacific APAC', factoryCityName: 'Shanghai', health_w_id: '1', health_e_id: '1') if Rails.env.development?

City.create!(continent_id: '1', name: 'New York', 		population: '8491079',  marketsize: '5863261') if Rails.env.development?
City.create!(continent_id: '1', name: 'Chicago', 		population: '2695598',  marketsize: '1861359') if Rails.env.development?
City.create!(continent_id: '1', name: 'Mexico City', 	population: '8874724',  marketsize: '965904')  if Rails.env.development?
City.create!(continent_id: '1', name: 'Panama City', 	population: '880691',   marketsize: '32447')   if Rails.env.development?
City.create!(continent_id: '1', name: 'San Francisco', 	population: '852469',   marketsize: '588647')  if Rails.env.development?
City.create!(continent_id: '1', name: 'Toronto', 		population: '2615060',  marketsize: '1613603') if Rails.env.development?

City.create!(continent_id: '1', name: 'Buenos Aires', 	population: '3054300',  marketsize: '222906')  if Rails.env.development?
City.create!(continent_id: '1', name: 'Rio De Janeiro', population: '6429923',  marketsize: '593693')  if Rails.env.development?

City.create!(continent_id: '2', name: 'Athens', 		population: '3090508',  marketsize: '279077')  if Rails.env.development?
City.create!(continent_id: '2', name: 'Frankfurt', 		population: '701350',   marketsize: '391175')  if Rails.env.development?
City.create!(continent_id: '2', name: 'London', 		population: '8238689',  marketsize: '4541269') if Rails.env.development?
City.create!(continent_id: '2', name: 'Moscow', 		population: '12197596', marketsize: '1479630') if Rails.env.development?
City.create!(continent_id: '2', name: 'Paris', 			population: '2241346',  marketsize: '1213075') if Rails.env.development?
City.create!(continent_id: '2', name: 'Rome', 			population: '4321244',  marketsize: '1552876') if Rails.env.development?

City.create!(continent_id: '2', name: 'Cairo', 			population: '9278441',  marketsize: '278202')  if Rails.env.development?
City.create!(continent_id: '2', name: 'Cape Town', 		population: '3740026',  marketsize: '270065')  if Rails.env.development?
City.create!(continent_id: '2', name: 'Lagos', 			population: '21516000', marketsize: '99762')   if Rails.env.development?

City.create!(continent_id: '3', name: 'Dubai', 			population: '2459068',  marketsize: '225554')  if Rails.env.development?
City.create!(continent_id: '3', name: 'Mumbai', 		population: '12478447', marketsize: '159883')  if Rails.env.development?
City.create!(continent_id: '3', name: 'Seoul', 			population: '10048850', marketsize: '5213153') if Rails.env.development?
City.create!(continent_id: '3', name: 'Shanghai', 		population: '24256800', marketsize: '929861')  if Rails.env.development?
City.create!(continent_id: '3', name: 'Singapore', 		population: '5535000',  marketsize: '2516351') if Rails.env.development?
City.create!(continent_id: '3', name: 'Sydney', 		population: '4840600',  marketsize: '2732035') if Rails.env.development?
City.create!(continent_id: '3', name: 'Tokyo', 			population: '13297629', marketsize: '7284411') if Rails.env.development?

Customer.create!(
	version_id: '1',
	name: 'Casual',
	alt: 'Transactional',
	description: 'PC for basic Usage (Internet, Reading). Mainly Budget Laptops.',
	purchaseRmin: '0.5',
	purchaseRmax: '0.8',
	revisitRmin: '0.7',
	revisitRmax: '0.95',
	rebuyRmin: '0.1',
	rebuyRmax: '0.4',
	rebuyIntervalmin: '3',
	rebuyIntervalmax: Float::INFINITY,
	A1_prod_char_SI_min: '0.15',
	A1_prod_char_SI_max: '0.2',
	A2_adv_char_SI_min: '0.2',
	A2_adv_char_SI_max: '0.25',
	A3_price_SI_min: '0.4',
	A3_price_SI_max: '0.5',
	A4_quality_SI_min: '0.05',
	A4_quality_SI_max: '0.1'
) if Rails.env.development?
Customer.create!(
	version_id: '1',
	name: 'Professional',
	alt: 'Application Oriented',
	description: 'Professional Usage at Office using Specific Applications and Software.',
	purchaseRmin: '0.8',
	purchaseRmax: '0.99',
	revisitRmin: '0.05',
	revisitRmax: '0.3',
	rebuyRmin: '0.1',
	rebuyRmax: '0.3',
	rebuyIntervalmin: '3',
	rebuyIntervalmax: Float::INFINITY,
	A1_prod_char_SI_min: '0.25',
	A1_prod_char_SI_max: '0.3',
	A2_adv_char_SI_min: '0.15',
	A2_adv_char_SI_max: '0.2',
	A3_price_SI_min: '0.2',
	A3_price_SI_max: '0.25',
	A4_quality_SI_min: '0.25',
	A4_quality_SI_max: '0.3' 
) if Rails.env.development?
Customer.create!(
	version_id: '1',
	name: 'Work on-the-Go',
	alt: 'Goal [mobility] oriented',
	description: 'Usage everywhere with the most possible ease. Mostly professional.',
	purchaseRmin: '0.8',
	purchaseRmax: '0.99',
	revisitRmin: '0.05',
	revisitRmax: '0.3',
	rebuyRmin: '0.1',
	rebuyRmax: '0.3',
	rebuyIntervalmin: '3',
	rebuyIntervalmax: Float::INFINITY,
	A1_prod_char_SI_min: '0.35',
	A1_prod_char_SI_max: '0.4',
	A2_adv_char_SI_min: '0.2',
	A2_adv_char_SI_max: '0.25',
	A3_price_SI_min: '0.1',
	A3_price_SI_max: '0.15',
	A4_quality_SI_min: '0.2',
	A4_quality_SI_max: '0.25' 
) if Rails.env.development?
Customer.create!(
	version_id: '1',
	name: 'Sophisticated',
	alt: 'Relational',
	description: 'Seeks for the most elegant and technologically advanced PC. Seeks for quality, reputation, design, minimum defaults. Wants poweful PC. Totally indiferent if it is laptop or desktop. Seek fot the newest, most innovative, most in brand.',
	purchaseRmin: '0.7',
	purchaseRmax: '0.9',
	revisitRmin: '0.5',
	revisitRmax: '0.6',
	rebuyRmin: '0.6',
	rebuyRmax: '0.85',
	rebuyIntervalmin: '3',
	rebuyIntervalmax: '12',
	A1_prod_char_SI_min: '0.15',
	A1_prod_char_SI_max: '0.19',
	A2_adv_char_SI_min: '0.35',
	A2_adv_char_SI_max: '0.40',
	A3_price_SI_min: '0.01',
	A3_price_SI_max: '0.05',
	A4_quality_SI_min: '0.35',
	A4_quality_SI_max: '0.4' 
) if Rails.env.development?
Customer.create!(
	version_id: '1',
	name: 'Hardcore Power',
	alt: 'PC Master Race / PC Enthusiasts / Innovator',
	description: 'The newest product. Always up for an upgrade. Specific needs. So a variety of products is needed to fulfil each user. Competitive Gamers, Demanding Professionals as Designers, Engineers are included in this category.',
	purchaseRmin: '0.7',
	purchaseRmax: '0.9',
	revisitRmin: '0.7',
	revisitRmax: '0.95',
	rebuyRmin: '0.4',
	rebuyRmax: '0.85',
	rebuyIntervalmin: '2',
	rebuyIntervalmax: '8',
	A1_prod_char_SI_min: '0.4',
	A1_prod_char_SI_max: '0.51',
	A2_adv_char_SI_min: '0.03',
	A2_adv_char_SI_max: '0.05',
	A3_price_SI_min: '0.05',
	A3_price_SI_max: '0.1',
	A4_quality_SI_min: '0.35',
	A4_quality_SI_max: '0.45' 
) if Rails.env.development?
#Casual User (transactional), Professional (application oriented), Hardcore Power/PC Master Race (only desktop), Sophisticated(relational) (the most elegant and technologically advanced. Apple lover), Work-on-the-go (only laptop)

totalMarketsize = City.sum("marketsize") #40908199
previousC = 0.0000
previousTot = 0.0000

City.all.each do |city|
	cityMarketsize = city.marketsize.to_f

	city.update_attributes(
		marketsizePer: (cityMarketsize/totalMarketsize).round(4)*100,
  		marketsizeRmin: previousC,
   		marketsizeRmax: previousC + (cityMarketsize/totalMarketsize).round(4)
  	)
  	previousC = city.marketsizeRmax

	previousCust = 0.0000
	hardMarket = rand(0.0400..0.0600).round(4)
	onthegoMarket = rand(0.0400..0.0600).round(4)
	sophMarket = rand(0.1000..0.1200).round(4)
	casualMarket = rand(0.4200..0.4700).round(4)
	profMarket = 1.0000-hardMarket-casualMarket-onthegoMarket-sophMarket
	Customer.all.each do |customer|
		case customer.name
		when 'Hardcore Power'
		  	marketsizeCustPer = hardMarket
		when 'Work on-the-Go'
		  	marketsizeCustPer = onthegoMarket
		when 'Sophisticated'
		  	marketsizeCustPer = sophMarket
		when 'Professional'
		  	marketsizeCustPer = profMarket
		else
		  	marketsizeCustPer = casualMarket
		end
		marketsize = cityMarketsize*marketsizeCustPer
		marketsizeTotPer = (marketsize/totalMarketsize).round(5)
		marketsizeTotRmax = previousTot + marketsizeTotPer
		CustCity.create!(
			city_id: city.id,
			customer_id: customer.id,
			marketsize: marketsize,
			marketsizeCustPer: marketsizeCustPer*100,
	   		marketsizeTotPer: marketsizeTotPer*100,
	  		marketsizeCustRmin: previousCust,
	   		marketsizeCustRmax: previousCust + marketsizeCustPer,
	  		marketsizeTotRmin: previousTot,
	   		marketsizeTotRmax: marketsizeTotRmax
		) if Rails.env.development?
	  	previousCust = previousCust + marketsizeCustPer
	  	previousTot = marketsizeTotRmax
	end
end

FunctionUsage.create!(
	version_id: '1',
	name: 'demand', # must exist with this exact name
	differentEachQ: true # => 1 se kathe trimino
) if Rails.env.development?
FunctionUsage.create!(
	version_id: '1',
	name: 'pricing', # must exist with this exact name
	differentEachCust: true # => 5
) if Rails.env.development?
FunctionUsage.create!(
	version_id: '1',
	name: 'test for function_g'
) if Rails.env.development?
FunctionUsage.create!(
	version_id: '1',
	name: 'test for cust_q_func',
	differentEachCust: true,
	differentEachQ: true # => 5 se kathe trimino
) if Rails.env.development?

demandValue = totalMarketsize.to_f/78*12 #1+2+3+4+5+6+7+8+9+10+11+12=78
scale = (10 ** (Math.log10(demandValue).to_i - 1) )
Function.create!(
	function_usage_id: '1',
	name: 'linear',
	function: 'd*(a*x+b)',
	function_copy: 'a*x+b',
	parAmin: '0.1',
	parAmax: '10',
	parAdef: '0.5',
	parAname: 'slope',
	parAscale: '1',
	parBmin: '0',
	parBmax: '50',
	parBdef: '1',
	parBname: 'offset (beggining demand [for month i] divided by D (scale))',
	parBscale: '0',
	parCmin: '0',
	parCmax: '60',
	parCdef: '0',
	parCname: 'month i',
	parCscale: '0',
	parDmin: '10000',
	parDmax: '1000000',
	parDdef: scale,
	parDname: 'scale',
	parDscale: '0'
) if Rails.env.development?
Function.create!(
	function_usage_id: '1',
	name: 'sigmoid',
	function: 'd*(c/(1+Math.exp(-a*(x-b) ) ) )',
	function_copy: 'd*(c/(1+e^{-a*(x-b) } ) )',
	parAmin: '0.25',
	parAmax: '0.75',
	parAdef: '0.50',
	parAname: 'slope',
	parAscale: '2',
	parBmin: '1',
	parBmax: '60',
	parBdef: '21',
	parBname: 'month with half the maximum demand',
	parBscale: '0',
	parCmin: '10',
	parCmax: '100',
	parCdef: (demandValue/scale).round(0),
	parCname: 'maximum deseasonalised demand of a month divided by D (scale) [asymptotic value]',
	parCscale: '0',
	parDmin: '10000',
	parDmax: '1000000',
	parDdef: scale,
	parDname: 'scale',
	parDscale: '0'
) if Rails.env.development?
Function.create!(
	function_usage_id: '2',
	name: 'linear',
	function: '1 - ( (x-b)/((c-1)*b) )',
	function_copy: '1 - ( (x-b)/((c-1)*b) )',
	parAname: 'b and c form the slope',
	parBmin: '250',
	parBmax: '5000',
	parBdef: '900',
	parBname: 'willing',
	parBscale: '0',
	parCmin: '1.01',
	parCmax: '4.00',
	parCdef: '1.50',
	parCname: 'threshold',
	parCscale: '2'
) if Rails.env.development?
Function.create!(
	function_usage_id: '2',
	name: 'asymptotic',
	function: '(10*(d ** a))/(10*x - b*(5*(c+1) + (c-1)*Math.sqrt((25*b + (d ** a)/(c-1))/b) ) ) + (10*(5 + Math.sqrt((25*b + (d ** a)/(c-1))/b) ) )',
	function_copy: '(10*(d^a))/(10*x - b*(5*(c+1) + (c-1)*\sqrt{(25*b + (d^a)/(c-1))/b} ) ) + (10*(5 + \sqrt{(25*b + (d^a)/(c-1))/b} ) )',
	parAmin: '0',
	parAmax: '10',
	parAdef: '8',
	parAname: 'slope 10 pow',
	parAscale: '1',
	parBmin: '250',
	parBmax: '5000',
	parBdef: '900',
	parBname: 'willing',
	parBscale: '0',
	parCmin: '1.01',
	parCmax: '4.00',
	parCdef: '1.50',
	parCname: 'threshold',
	parCscale: '2',
	parDmin: '10',
	parDmax: '10',
	parDdef: '10',
	parDname: 'influence pow base',
	parDscale: '0'
) if Rails.env.development?
Function.create!(
	function_usage_id: '3',
	name: 'test 1',
	function: 'test 1'
) if Rails.env.development?
Function.create!(
	function_usage_id: '4',
	name: 'test 2',
	function: 'test 2',
	parAname: 'test A',
	parAdef: '850',
	parCname: 'test C',
	parCdef: '2.00',
) if Rails.env.development?

CustFunc.create!(
	function_id: '3',
	customer_id: '2',
	parBdef: '1600',
	parCdef: '3.50'
) if Rails.env.development?
CustFunc.create!(
	function_id: '6',
	customer_id: '2',
	parAdef: '100',
	parCdef: '1.76'
) if Rails.env.development?
=begin

sqrt
1 - (4 (((1 - c) d^a)/(100 b) + c))/(c + 1)^2
1 - (4 ((1 - c)/(100 b s) + c))/(c + 1)^2

b
1/2 s (b c + b) (sqrt(1 - (4 (((1 - c) d^a)/(100 b) + c))/(c + 1)^2) + 1)
1/2 s (b c + b) (sqrt(1 - (4 ((1 - c)/(100 b s) + c))/(c + 1)^2) + 1)

c
(10 (sqrt((c - 1) (1/(b s) + 25 c - 25)) + 5 c - 5))/(c - 1)
1/(1/10 b (c + 1) s (sqrt(((c - 1) (25 b (c - 1) s + 1))/(b (c + 1)^2 s)) + 5) - b c s)

final function:
(10 (-5 + 5 c + Sqrt[((-1 + c) (25 b (-1 + c) + d^a))/b]))/(-1 + c) - (10 d^a)/(b (1 + c) (5 + Sqrt[((-1 + c) (25 b (-1 + c) + d^a))/(b (1 + c)^2)]) - 10 x)

function for Ruby
(10*(5*(c-1) + Math.sqrt(((c-1)*(25*b*(c-1) + (d ** a)))/b)))/(c-1) - (10*(d ** a))/(b*(1 + c)*(5 + Math.sqrt(((c-1)*(25*b*(c-1) + (d ** a)))/(b*((1 + c) ** 2)))) - 10*x)

--------------------------------

example for
d=10
a=5
b=3330
c=1.5
(10 (-5 + 5 1.5 + Sqrt[((-1 + 1.5) (25 3330 (-1 + 1.5) + 10^5))/3330]))/(-1 + 1.5) - (10 10^5)/(3330 (1 + 1.5) (5 + Sqrt[((-1 + 1.5) (25 3330 (-1 + 1.5) + 10^5))/(3330 (1 + 1.5)^2)]) - 10 x)


(10 (-5 + 5 1.01 + Sqrt[((-1 + 1.01) (25 3330 (-1 + 1.01) + 10^4))/3330]))/(-1 + 1.01) - (10 10^4)/(3330 (1 + 1.01) (5 + Sqrt[((-1 + 1.01) (25 3330 (-1 + 1.01) + 10^4))/(3330 (1 + 1.01)^2)]) - 10 x)
(10 (-5 + 5*2 + [((-1 + 2) (25*3330 (-1 + 2) + 10^8))/3330]))/(-1 + 2) - (10* 10^8)/(3330 (1 + 2) (5 + [((-1 + 2) (25*3330 (-1 + 2) + 10^8))/(3330 (1 + 2)^2)]) - 10*x)

----------------------------------

d=10
a=3
b=750
c=1.2 (costcutter)
(10*(10^3))/(10*x-750*(5*(1.2+1)+(1.2-1)*\sqrt{((25*750+(10^3)/(1.2-1))/750)}))+(10*(5+\sqrt{((25*750+(10^3)/(1.2-1))/750)}))
(10*(10 ** 3))/(10*x - 750*(5*(1.2+1) + (1.2-1)*M3th.sqrt((25*750 + (10 ** 3)/(1.2-1))/750) ) ) + (10*(5 + M3th.sqrt((25*750 + (10 ** 3)/(1.2-1))/750) ) )

----------------------------------

  a=2
  s=(1.round(a))/(10 ** a)
  b=3300
  c=1
  m=(b*c).round(0)

  sqrt=eval('1-(4*(((1-c)/(100*s*b)+c)/((1+c) ** 2) ) )')
  if sqrt > 0
    b1=eval('(((b+b*c)*s)/2)*(1+Math.sqrt(sqrt))')
    c1=eval('1/(b1-s*b*c)')
    #(-riza): c2>0 an b>0 kai c>1 kai s<=-1/(25b(c-1)) (atopo)
  end
    puts(a, (b*c).round(0), sqrt, b1, c1)

=end
=begin
Function.create!(
	version_id: '',
	function_usage_id: '',
	name: '',
	function: '',
	function_copy: '',
	parAmin: '',
	parAmax: '',
	parAdef: '',
	parAname: '',
	parBmin: '',
	parBmax: '',
	parBdef: '',
	parBname: '',
	parBscale: '',
	parCmin: '',
	parCmax: '',
	parCdef: '',
	parCname: '',
	parCscale: '',
	parDmin: '',
	parDmax: '',
	parDdef: '',
	parDname: '',
	parDscale: ''
) if Rails.env.development?
Function.create!(
	version_id: '',
	function_usage_id: '',
	name: '',
	function: '',
	function_copy: '',
	parAmin: '',
	parAmax: '',
	parAdef: '',
	parAname: '',
	parBmin: '',
	parBmax: '',
	parBdef: '',
	parBname: '',
	parBscale: '',
	parCmin: '',
	parCmax: '',
	parCdef: '',
	parCname: '',
	parCscale: '',
	parDmin: '',
	parDmax: '',
	parDdef: '',
	parDname: '',
	parDscale: ''
) if Rails.env.development?
=end

Month.create!(
	version_id: '1',
	no: '1',
	name: 'January',
	noDays: '31',
	seasonPer: '68.01'
) if Rails.env.development?
Month.create!(
	version_id: '1',
	no: '2',
	name: 'February',
	noDays: '28',
	seasonPer: '90.43'
) if Rails.env.development?
Month.create!(
	version_id: '1',
	no: '3',
	name: 'March',
	noDays: '31',
	seasonPer: '100.11'
) if Rails.env.development?
Month.create!(
	version_id: '1',
	no: '4',
	name: 'April',
	noDays: '30',
	seasonPer: '56.60'
) if Rails.env.development?
Month.create!(
	version_id: '1',
	no: '5',
	name: 'May',
	noDays: '31',
	seasonPer: '42.32'
) if Rails.env.development?
Month.create!(
	version_id: '1',
	no: '6',
	name: 'June', 
	noDays: '30',
	seasonPer: '63.72'
) if Rails.env.development?
Month.create!(
	version_id: '1',
	no: '7',
	name: 'July',
	noDays: '31',
	seasonPer: '49.89'
) if Rails.env.development?
Month.create!(
	version_id: '1',
	no: '8',
	name: 'August',
	noDays: '31',
	seasonPer: '59.23'
) if Rails.env.development?
Month.create!(
	version_id: '1',
	no: '9',
	name: 'September',
	noDays: '30',
	seasonPer: '121.01'
) if Rails.env.development?
Month.create!(
	version_id: '1', 
	no: '10',
	name: 'October',
	noDays: '31',
	seasonPer: '77.43'
) if Rails.env.development?
Month.create!(
	version_id: '1',
	no: '11',
	name: 'November',
	noDays: '30',
	seasonPer: '284.09'
) if Rails.env.development?
Month.create!(
	version_id: '1',
	no: '12',
	name: 'December',
	noDays: '31',
	seasonPer: '319.57'
) if Rails.env.development?
