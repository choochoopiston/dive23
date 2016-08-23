require 'rails_helper'

RSpec.describe Vote, type: :model do
  describe 'Association' do
    it { should belong_to(:answer) }
    it { should belong_to(:question) }
    it { should belong_to(:user) }
  end    
end
