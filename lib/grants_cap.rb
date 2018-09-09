require 'pry'

# Find the sample grants cap: divide the budget by the total number of grants
# Use the sample grants cap to determine if a grant is above or below that value
# If a grant is below that value, the grant does not change, if it is above that value than mark it for change
# Finish: Use the number of grants that need to change plus the number of grants that don't change to set a new grants cap
class GrantsCap
  def self.find_grants_cap(grantsArray, newBudget)
    max_grant(grantsArray, newBudget)
  end

  def self.split_new_budget(grantsArray, newBudget)
    grantsArray.each do |grant|
      # binding.pry
      if grant <= sample_cap(grantsArray, newBudget)
        newBudget -= grant
      end
    end
    return newBudget
  end

  def self.max_grant(grantsArray, newBudget)
    grantsArray.each do |grant|
      binding.pry
      if grant > sample_cap(grantsArray, newBudget) && split_new_budget(grantsArray, newBudget) < newBudget
        max = split_new_budget(grantsArray, newBudget)/ large_grants_size(grantsArray, newBudget)
      elsif grant > sample_cap(grantsArray, newBudget) && split_new_budget(grantsArray, newBudget) == nil
        max = grantsArray/large_grants_size(grantsArray, newBudget)
      end
    end
    return max
  end

  # def self.grant_max(grantsArray, newBudget)
  #   grantsArray.map do |grant|
  #     if grant > sample_cap(grantsArray, newBudget)
  #       max = new_large_grant_budget.to_f/ large_grants_size(grantsArray, newBudget)
  #     end
  #   end
  #   max
  # end

  private

  def self.large_grants_size(grantsArray, newBudget)
    grantsArray.count { |large_grant| large_grant > sample_cap(grantsArray, newBudget) }
  end


  def self.sample_cap(grantsArray, newBudget)
    newBudget.to_f/ grantsArray.size
  end

  # def self.new_grant_max(grantsArray, newBudget)
  #   binding.pry
  #   split_new_budget(grantsArray, newBudget) / large_grants_size(grantsArray)
  # end

  # def self.new_grants_array(grantsArray, newBudget)
  #   grantsArray.map do |grant|
  #     # binding.pry
  #     if grant < sample_cap(grantsArray, newBudget)
  #       grant
  #     elsif grant > sample_cap(grantsArray, newBudget)
  #       new_grant_max(grantsArray, newBudget)
  #     end
  #   end
  # end
end
