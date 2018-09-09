require 'rspec'
require 'grants_cap'

RSpec.describe 'GrantsCap' do
  let(:array) { [1, 4] }
  let(:budget) { 3 }
  describe 'find_grants_cap' do
    it 'gives you the cap' do
      expect(GrantsCap.find_grants_cap(array, budget)).to eq(1.5)
    end
  end
end
