ActiveAdmin.register Game do
	permit_params :version_id, :first_month_id, :name, :duration
	before_filter :ensure_admin!

	# Disable edit and destroy actions
	actions :index, :show, :new, :create

	action_item :delete, only: :show do
		q = Quarter.where(game_id: game.id).order(q_no: :desc).take
		if q.nil?
  			link_to "Delete Game", delete_admin_game_path(game), method: :put
		end
	end

  	member_action :delete, method: :put do
	  	game = Game.find(params[:id])
	  	game.destroy
	  	redirect_to admin_games_path
	end

	action_item :proceed, only: :show do
	q = Quarter.where(game_id: game.id).order(q_no: :desc).take
	if q.nil?
  		link_to "Start Game", proceed_admin_game_path(game), method: :put, 
		  		data: {confirm: "Please be sure that you have filled all the required parameters:\n-players of the game\nDo you want to start the game now?" } #, target: "_blank" if you want to open new window
		elsif q.q_no < game.duration
	  		link_to "Go to Next Quarter", proceed_admin_game_path(game), method: :put, 
		    		data: {confirm: "Please be sure that you have filled all the required parameters:\n-function parameters for the game/quarter\n-function parameters depending on customer. \nDo you want to proceed to the following quarter?" }
		elsif q.q_no == game.duration && !game.finished
	  		link_to "Finish Game", proceed_admin_game_path(game), method: :put, 
		    		data: {confirm: "Please be sure that you have filled all the required parameters:\n-function parameters for the game/quarter\n-function parameters depending on customer. \nDo you want to proceed to the final results?" }
		end
	end

  	member_action :proceed, method: :put do
	  	game = Game.find(params[:id])
		q = Quarter.where(game_id: game.id).order(q_no: :desc).take
		if q.nil? 
			q_no = 1
			Customer.all.each do |customer|
				CustG.create!(
			 		game_id: game.id,
			  		customer_id: customer.id
				)
			end
			FunctionUsage.all.each do |usage|
				if !usage.fixedPars && !usage.differentEachQ
			      	if !usage.differentEachCust
			    		FunctionG.create!(
				  			game_id: game.id,
			      			function_usage_id: usage.id
		    			)
			      	else
			    		Customer.all.each do |customer|
			  	  			CustGFunc.create!(
			  	    			customer_id: customer.id,
				    			game_id: game.id,
			        			function_usage_id: usage.id
			  	  			)
		    			end
		  			end
				end
			end
		else
		  	# extract simulation results here
			usage_id = FunctionUsage.where(version_id: game.version_id, name: "demand").take.id
			demandPer = q.rangeDemandPer
			demandFunc = FunctionQ.where(quarter_id: q.id, function_usage_id: usage_id).take
			if demandFunc.function_id.nil? # choose a random function for demand if not selected (parameters will be auto assigned)
				demandFunc.update_attributes(
					function_id: Function.where(function_usage_id: usage_id).take.id
				)
				demandFunc = FunctionQ.find(demandFunc.id)
			end
			parentFunc = Function.find(demandFunc.function_id)
			a = demandFunc.parA
			b = demandFunc.parB
			c = demandFunc.parC
			d = demandFunc.parD
			fist_month = Month.find(game.first_month_id).no
			offset = 3 * (q.q_no - 1)
			current_month = offset + fist_month - 1 # - 1, cause number starts from 1
# ----------- Example for Products
			productIds = [] # assign product id here
			custIds = [] # assign customer id here
			counter = 0
			Customer.all.each do |cust|
				custIds[cust.id] = counter
				counter = counter + 1
			end
			products = [] # Retrieve it from database when there is client side developed
			products[0] = [84, 75, 1, 15, 18] # examples for testing
			products[1] = [83, 76, 1, 25, 33]
			products[2] = [24, 37, 71, 56, 55]
			products[3] = [2, 17, 76, 67, 49]
			productsNo = 3
			sortedPr = []
			sortedPr[0] = [0, 1, 2, 3]
			sortedPr[1] = [1, 0, 2, 3]
			sortedPr[2] = [3, 2, 0, 1]
			sortedPr[3] = [3, 2, 1, 0]
			sortedPr[4] = [2, 3, 1, 0]
# -----------
			for i in 0..2
				m = (current_month + i) % 12 + 1 # + 1, cause number starts from 1
				month = Month.where(no: m).take
				x = offset + i
				demandP = eval(Function.find(demandFunc.function_id).function)*month.seasonPer/100
				demandMin = (demandP*(100-demandPer)/100).round(0)
				demandMax = (demandP*(100+demandPer)/100).round(0)
				demandS = rand(demandMin..demandMax)
				mq = Mq.create!(
					quarter_id: q.id,
					month_id: month.id,
					demandPmin: demandMin,
					demandPmax: demandMax,
					demandS: demandS
				)
				marketsizeArr = []
				demandPArr = []
				demandSArr = []
				demandSProdArr = []
				buySProdArr = []
				custMap = []
				marketsizeMin = 0
				marketsizeMax = 0 # keep max to define loop times
				scale = 5 # taken from CreateCustCities
				integer = 10**5
				# n: demand
				# m: cust_city entries
				# O(n) linear generate/save of demand and O(m) linear searches/insertions in database => fastest way since m << n
				CustCity.order(marketsizeTotRmin: :asc).all.each do |custcity|
					demandPArr[custcity.id] = ((custcity.marketsizeTotPer*demandP)/100).round(0) # predicted demand (exists for visual comparison with simulation)
					marketsizeMin = (custcity.marketsizeTotRmin*integer).round(0).to_i
					marketsizeMax = (custcity.marketsizeTotRmax*integer).round(0).to_i
					if marketsizeMin == marketsizeMax
						marketsizeMax = marketsizeMax + 1
					end
					for k in marketsizeMin...marketsizeMax
						marketsizeArr[k] = custcity.id
						custMap[k] = custcity.customer_id
					end
				end
				for j in 1..demandS
					marketsize = rand(0...marketsizeMax)
					demandSArr[marketsizeArr[marketsize]] = demandSArr[marketsizeArr[marketsize]].to_i + 1
# ----------- Example for Products
					cust_no = custIds[custMap[marketsize]]
					if cust_no == 0
						productScores = {'0': 84, '1': 83, '2': 24, '3': 2}
					elsif cust_no == 1
						productScores = {'0': 75, '1': 76, '2': 37, '3': 17}
					elsif cust_no == 2
						productScores = {'0': 1, '1': 1, '2': 71, '3': 76}
					elsif cust_no == 3
						productScores = {'0': 15, '1': 25, '2': 56, '3': 67}
					else
						productScores = {'0': 18, '1': 33, '2': 55, '3': 49}
					end
					productScores.stringify_keys!()
					for l in 0..productsNo
						selectProd = rand(0..100)
#						pr_no = sortedPr[cust_no][l]
						pr_no = -1

						sum = productScores.inject(0) do |sum, item_and_weight|
							sum += item_and_weight[1]
						end
						target = rand(sum)
						productScores.each do |item, weight|
							if target <= weight
								pr_no = item.to_i
								break
							end
							target -= weight
      					end

						score = products[pr_no][cust_no]
						demandSProdArr[pr_no] = demandSProdArr[pr_no].to_i + 1
						if selectProd <= score
							buySProdArr[pr_no] = buySProdArr[pr_no].to_i + 1
							break
						else
							productScores.except!(pr_no.to_s)
						end
					end
# -----------
				end
				demandSArr.each_with_index do |demandS, cust_city_id|
					CustGMqCity.create!(
						mq_id: mq.id,
						cust_city_id: cust_city_id,
						demandS: demandS || 0,
						demandP: demandPArr[cust_city_id]
					) unless cust_city_id==0
				end
#puts buySProdArr
			end
	  		q_no = q.q_no + 1 # proceed to next quarter
  		end
	  	if q_no <= game.duration
	  		quarter = Quarter.create!(
			    game_id: game.id,
			    q_no: q_no
		  	)
			game.update_attributes( # it is ovewritten in game model
				current_quarter: q_no
			)
		  	Company.where(game_id: game.id).each do |comp|
		  		CompQ.create!(
	    	  		company_id: comp.id,
		      		quarter_id: quarter.id
		  		)
		  	end
		  	FunctionUsage.all.each do |usage|
		  		if !usage.fixedPars && usage.differentEachQ
	  	      		if !usage.differentEachCust
			    		FunctionQ.create!(
		    	  			quarter_id: quarter.id,
			      			function_usage_id: usage.id
			    		)
	  	      		else
		   				Customer.all.each do |customer|
			      			CustQFunc.create!(
			      				quarter_id: quarter.id,
	      	        			customer_id: customer.id,
		            			function_usage_id: usage.id
	  	  	      			)
		    			end
		  			end
		  		end
		  	end
	  	else
		  game.update_attributes(
		    current_quarter: (game.duration+1),
		    finished: true
	  	  )
		end
		if q_no > 1
  			redirect_to(admin_cust_g_mq_cities_path, flash: {notice: 'You can see the results of Demand in this Page.', warning: 'Change default Parameters in Tables with Q before proceeding'})

  		else
  			redirect_to(admin_quarters_path, flash: {warning: 'Fill Tables with Q and G before starting the Game'})
		end
  	end

	show do
		default_main_content
		q = Quarter.where(game_id: params[:id]).order(q_no: :desc).take
		strong (button_to "Add CEOs", new_admin_company_path, method: :get) if q.nil?
	end
end
