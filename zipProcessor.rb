class ZipProcessor
  def getRateArea(zipcode)  
	  list = @zipcodes.select { |z| z.zipcode.to_s == zipcode.to_s }
    if list == nil || list.count == 0
        return nil
    elsif list.count > 1
      #just in case there are multiple found, see if they all have same state and rate area
       state = list[0].state
       rate = list[0].rate_area
       matches = list.reject { |z| z.state == state && z.rate_area == rate }
       if matches.count > 0
         #didn't all match
         return nil
      end
    end
    sra = StateRateArea.new()
    sra.state = list[0].state
    sra.rate_area = list[0].rate_area
    return sra
  end
  
  def readFrom(filename)  
    @zipcodes = Array.new
    f = File.open(filename, "r")
    f.each_line { |line|
      fields = line.split(',')  
      z = ZipCodeDetails.new()
	    z.zipcode = fields[0]
	    z.state = fields[1]
	    z.county_code = fields[2]
	    z.name = fields[3]
	    z.rate_area = fields[4]	  
      if z.zipcode != "zipcode"
        @zipcodes.push(z)
      end
    }  

  end

end
