require 'rails_helper'

RSpec.describe Tag, type: :model do
  describe 'Association' do
    it { should have_one(:tag_relation) }
  end
end
