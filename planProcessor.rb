class PlanProcessor  
  def getByRateArea(rateArea)      
	return @plans.select { |p| p.rate_area == rateArea.rate_area && p.state == rateArea.state }
  end
  
  def readFrom(filename)
  
    @plans = Array.new
	
    f = File.open(filename, "r")

    f.each_line { |line|
      fields = line.split(',')  
      p = Plan.new()	  
	  p.plan_id = fields[0]
	  p.state = fields[1]
	  p.metal_level = fields[2]
	  p.rate = fields[3]
	  p.rate_area = fields[4]	  
      @plans.push(p)
    }  
  end
end

