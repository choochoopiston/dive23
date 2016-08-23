require 'rails_helper'

RSpec.describe TagRelation, type: :model do
  describe 'Association' do
    it { should belong_to(:question) }
  end
end