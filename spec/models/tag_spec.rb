require 'rails_helper'

RSpec.describe Tag, type: :model do
  describe 'Association' do
    it { should have_many(:tag_relations) }
  end
end
