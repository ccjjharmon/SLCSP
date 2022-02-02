class SLCSP
  def SLCSP.Get(plans)
    if plans == nil || plans.count == 0
      return nil
    end
    silverPlans = plans.select { |p| p.metal_level == "Silver" } # filter plans to just Silver
	sortedSilverPlans = silverPlans.sort_by { |p| p.rate } # sort by rate
	sp1 = sortedSilverPlans.map { |p| p.rate } # extract just rates
	sp2 = sp1.uniq # remove duplicates    	 
    if sp2.count <= 1
      return nil
    end
    return sp2[1]
  end
end
