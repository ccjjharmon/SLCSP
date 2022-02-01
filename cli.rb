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
	  
f = File.open("slcsp.csv", "r")

f.each_line { |line|
  fields = line.split(',')  
  zipcode = fields[0];
  
  ratearea = zipProcessor.getRateArea(zipcode)   
  plans = planProcessor.getByRateArea(ratearea)
  puts plans.count
	
  value = SLCSP.get(plans)
    
  puts zipcode + "," + value 
}  
