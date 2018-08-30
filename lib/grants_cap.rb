def find_grants_cap(grantsArray, newBudget)
  # your code goes here
  # N research grants
  # oldbudget -cutbacks = newBudget
  # split_new_budget = newBudget - grants_that_dont_change.sum
  # new_grant_max = split_new_budget / large_grants
  # new_grants_array = [grants_that_dont_change & new_grants]
  sample_cap = newBudget/ grantsArray.size

  split_new_budget = grantsArray.map do |grant|
    if grant < sample_cap
      ammended_budget = newBudget - grant
    end

    ammended_budget
  end

  # large_grants_size = grantsArray.map do |large_grant|
  #   if large_grant > sample_cap
  #     how_many_large_grants = grantsArray.count(large_grant)
 #    end
 #    how_many_large_grants
 #  end

  large_grants_size = grantsArray.count { |large_grant| large_grant > sample_cap }

  new_grant_max = split_new_budget / large_grants_size

  new_grants_array = grantsArray.map do |grant|
    if grant < sample_cap
      grant
    elsif grant > sample_cap
      new_grant_max = grant
    end
  end

  new_grants_array
end

