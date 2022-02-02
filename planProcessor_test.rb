# planProcessor_test.rb
require "test/unit"
require_relative './planProcessor'
require_relative './plan'
require_relative './stateRateArea'

class PlanProcessorTest < Test::Unit::TestCase
  def test_planProcessor_getByRateArea_nil
	planProcessor = PlanProcessor.new()
    assert_equal nil, planProcessor.getByRateArea(nil), "getByRateArea should return nil when provided nil"
  end
  
  def test_planProcessor_getByRateArea_singleElement
    state = "TX"
	rate_area = 1
	planProcessor = PlanProcessor.new()
	
	p = Plan.new()	  
	p.state = state
	p.rate_area = rate_area
	planProcessor.add(p)	
	
	sra = StateRateArea.new()
    sra.state = state
    sra.rate_area = rate_area
	
	list = planProcessor.getByRateArea(sra)
    assert_equal 1, list.count, "getByRateArea should return one plan"
	assert_equal state, list[0].state, "getByRateArea should return one plan with correct state"
	assert_equal rate_area, list[0].rate_area, "getByRateArea should return one plan with correct rate_area"
  end
  
  def test_planProcessor_getByRateArea_MultiplePlansSameStateRateArea_twoElements
    state = "TX"
	rate_area = 1
	planProcessor = PlanProcessor.new()
	
	p = Plan.new()	  
	p.state = state
	p.plan_id = "12A"
	p.rate_area = rate_area
	planProcessor.add(p)	

	p = Plan.new()	  
	p.plan_id = "4G12"
	p.state = state
	p.rate_area = rate_area
	planProcessor.add(p)	

	p = Plan.new()	  
	p.plan_id = "4G12"
	p.state = state
	p.rate_area = -rate_area
	planProcessor.add(p) #will not be counted since rate_area is not same
	
	sra = StateRateArea.new()
    sra.state = state
    sra.rate_area = rate_area
	
	list = planProcessor.getByRateArea(sra)
    assert_equal 2, list.count, "getByRateArea should return two plans"
	assert_equal state, list[0].state, "getByRateArea should return correct state"
	assert_equal rate_area, list[0].rate_area, "getByRateArea should return correct rate_area"
	assert_equal state, list[1].state, "getByRateArea should return correct state"
	assert_equal rate_area, list[1].rate_area, "getByRateArea should return correct rate_area"
  end
  
end