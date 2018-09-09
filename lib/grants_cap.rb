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
      if grant <= sample_cap(grantsArray, newBudget)
        newBudget -= grant
      end
    end
    newBudget
  end


  def self.max_grant(grantsArray, newBudget)
    grant_cap = 0

    grantsArray.each do |grant|
      if split_new_budget(grantsArray, newBudget) < newBudget
        grant_cap = split_new_budget(grantsArray, newBudget)/ large_grants_size(grantsArray, newBudget).to_f
      elsif split_new_budget(grantsArray, newBudget) == newBudget
        grant_cap = newBudget.to_f / large_grants_size(grantsArray, newBudget)
      end
    end
    grant_cap
  end

  private

  def self.large_grants_size(grantsArray, newBudget)
    grantsArray.count { |large_grant| large_grant > sample_cap(grantsArray, newBudget) }
  end


  def self.sample_cap(grantsArray, newBudget)
    newBudget.to_f/ grantsArray.size
  end
end
