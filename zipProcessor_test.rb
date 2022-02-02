# zipProcessor_test.rb
require "test/unit"
require_relative './zipProcessor'
require_relative './zipCodeDetails'
require_relative './stateRateArea'

class ZipProcessorTest < Test::Unit::TestCase
  def test_zipProcessor_getRateArea_nil
	zipProcessor = ZipProcessor.new()
    assert_equal nil, zipProcessor.getRateArea(nil), "getRateArea should return nil when provided nil"
  end
  
  def test_zipProcessor_getRateArea_SingleZip_ReturnsStateRateArea
    zip = "76039"
	state = "TX"
	rate_area = 4
	zipProcessor = ZipProcessor.new()
	
	z = ZipCodeDetails.new()	  
	z.zipcode = zip
	z.state = state
	z.rate_area = rate_area
	zipProcessor.add(z)	
	
	sra = zipProcessor.getRateArea(zip)
    assert_not_nil sra, "getRateArea should return a not-nil state rate area"
	assert_equal state, sra.state, "getRateArea should return state rate area with correct state"
	assert_equal rate_area, sra.rate_area, "getRateArea should return state rate area with correct rate_area"
  end
  
  def test_zipProcessor_getRateArea_MultipleMatchingZips_ReturnsStateRateArea
    zip = "76039"
	state = "TX"
	rate_area = 4
	zipProcessor = ZipProcessor.new()
	
	z = ZipCodeDetails.new()	  
	z.zipcode = zip
	z.name = "Dallas"
	z.state = state	
	z.rate_area = rate_area
	zipProcessor.add(z)	
	
	z = ZipCodeDetails.new()	  
	z.zipcode = zip
	z.name = "Tarrant"
	z.state = state
	z.rate_area = rate_area
	zipProcessor.add(z)	

	sra = zipProcessor.getRateArea(zip)
    assert_not_nil sra, "getRateArea should return a not-nil state rate area"
	assert_equal state, sra.state, "getRateArea should return state rate area with correct state"
	assert_equal rate_area, sra.rate_area, "getRateArea should return state rate area with correct rate_area"
  end  
  
  def test_zipProcessor_getRateArea_MultipleZipsNotMatching_ReturnsNoStateRateArea
    zip = "76039"
	state = "TX"
	rate_area = 4
	zipProcessor = ZipProcessor.new()
	
	z = ZipCodeDetails.new()	  
	z.zipcode = zip
	z.name = "Dallas"
	z.state = state	
	z.rate_area = -rate_area #not same rate area makes it not match
	zipProcessor.add(z)	
	
	z = ZipCodeDetails.new()	  
	z.zipcode = zip
	z.name = "Tarrant"
	z.state = state
	z.rate_area = rate_area
	zipProcessor.add(z)	

	sra = zipProcessor.getRateArea(zip)
    assert_nil sra, "getRateArea should return a not-nil state rate area"	
  end
  
end