class PlanProcessor  
  def getByRateArea(rateArea)      
    if rateArea == nil
      return nil
    end
	  list = @plans.select { |p| p.rate_area == rateArea.rate_area && p.state == rateArea.state }
    return list
  end
  
  def readFrom(filename)
    @plans = Array.new
    f = File.open(filename, "r")
    f.each_line { |line|
      fields = line.split(',')  
      p = Plan.new()	  
	    p.plan_id = fields[0].to_s
	    p.state = fields[1].to_s
	    p.metal_level = fields[2].to_s
	    p.rate = fields[3].to_f
	    p.rate_area = fields[4]	  
      if p.plan_id != "plan_id"
        @plans.push(p)
      end
    }  
  end
  
end

