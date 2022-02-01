class ZipProcessor
  def getRateArea(zipcode)  
	return @zipcodes.select { |z| z.zipcode == zipcode }
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
      @zipcodes.push(z)
    }  
  end

end
