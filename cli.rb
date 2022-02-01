class StateRateArea
  attr_accessor :state, :rate_area
end

class ZipCodeDetails
  attr_accessor :zipcode, :state, :county_code, :name, :rate_area
end

class Plan
  attr_accessor :plan_id, :state, :metal_level, :rate, :rate_area
end

class ZipProcessor
  def getRateArea(zipcode)  
	return "1"
  end    
end

class PlanProcessor  
  def getByRateArea(ratearea)  
    return nil
  end
end

class SLCSP
  def SLCSP.Get()
    return nil
  end
end

zipProcessor = ZipProcessor.new()
planProcessor = PlanProcessor.new()
	  
zipcode = "23832"
ratearea = StateRateArea.new()
ratearea.state = "VA"
ratearea.rate_area = 3

plans = planProcessor.getByRateArea(ratearea)
	
value = "10.12"
  
puts zipcode + "," + value


