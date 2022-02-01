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
  zipcode = fields[0].to_s;
  value = "rate"

  if zipcode != "zipcode"
  
    ratearea = zipProcessor.getRateArea(zipcode)   
    plans = planProcessor.getByRateArea(ratearea)
    value = SLCSP.Get(plans)
  end

  puts [zipcode, ",", value].map(&:to_s).join('')
}  
