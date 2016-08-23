require 'rails_helper'

RSpec.describe TagRelation, type: :model do
  describe 'Association' do
    it { should belong_to(:question) }
    it { should belong_to(:tag) }
  end
end