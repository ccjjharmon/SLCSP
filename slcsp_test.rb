# slcsp_test.rb
require "test/unit"
require_relative './sLCSP'
require_relative './plan'

class SLCSPTest < Test::Unit::TestCase
  def test_slcsp_get_nil
    assert_nil SLCSP.Get(nil), "Get should return nil when provided nil"
  end
  
  def test_slcsp_get_NoSilverPlans_ReturnsNil
    plans = Array.new

	p = Plan.new()	  
	p.state = "GA"
	p.metal_level = "Gold"
	p.rate_area = 5
	plans.push(p)	
		
	result = SLCSP.Get(plans)
    assert_nil result, "Get should return nil when no silver plans provided"
  end
  
  def test_slcsp_get_OneSilverPlans_ReturnsNil
    plans = Array.new

	p = Plan.new()	  
	p.state = "GA"
	p.metal_level = "Silver"
	p.rate_area = 5
	plans.push(p)	
		
	result = SLCSP.Get(plans)
    assert_nil result, "Get should return nil when only one silver plan provided"
  end
    
  def test_slcsp_get_MultipleSilverPlans_ReturnsSecondValue
    rate = 120.10
	plans = Array.new

	p = Plan.new()	  
	p.state = "GA"
	p.metal_level = "Silver"
	p.rate_area = 5
	p.rate = rate * 3
	plans.push(p)	
	
	p = Plan.new()	  
	p.state = "GA"
	p.metal_level = "Silver"
	p.rate_area = 5
	p.rate = rate
	plans.push(p)	

	p = Plan.new()	  
	p.state = "GA"
	p.metal_level = "Silver"
	p.rate_area = 5
	p.rate = rate * 2
	plans.push(p)	
	
	p = Plan.new()	  
	p.state = "GA"
	p.metal_level = "Silver"
	p.rate_area = 5
	p.rate = rate * 4
	plans.push(p)	
		
	result = SLCSP.Get(plans)
    assert_not_nil result, "Get should return valid not-nil result when only one silver plan provided"
	assert_equal rate * 2, result, "Get should return second value"
  end
end