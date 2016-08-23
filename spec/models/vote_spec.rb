require 'rails_helper'

RSpec.describe Vote, type: :model do
  describe 'Association' do
    it { should belong_to(:question) }
  end    
end
