class StateRateArea

  def initialize(zipcode)
    state = zipcode.state
	rate_area = zipcode.rate_area
  end

  attr_accessor :state, :rate_area

end
