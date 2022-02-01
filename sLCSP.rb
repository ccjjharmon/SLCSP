class SLCSP
  def SLCSP.Get(plans)
    if plans == nil || plans.count == 0
      return nil
    end
    silverPlans = plans.select { |p| p.metal_level == "Silver" }
    sortedSilverPlans = silverPlans.sort_by { |p| p.rate }
    if sortedSilverPlans.count <= 1
      return nil
    end
    return sortedSilverPlans[1].rate
  end
end
