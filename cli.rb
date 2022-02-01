require "./plan.rb"
require "./zipCodeDetails.rb"
require "./zipProcessor.rb"
require "./planProcessor.rb"
require "./sLCSP.rb"
require "./stateRateArea.rb"

zipProcessor = ZipProcessor.new()
zipProcessor.readFrom("zips.csv")

planProcessor = PlanProcessor.new()
planProcessor.readFrom("plans.csv")
	  
zipcode = "23832"
ratearea = StateRateArea.new()
ratearea.state = "VA"
ratearea.rate_area = 3

plans = planProcessor.getByRateArea(ratearea)
	
value = "10.12"
  
puts zipcode + "," + value


