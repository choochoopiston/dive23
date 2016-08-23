require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'Association' do
    it { should have_many(:answers) }
    it { should have_many(:favorites) }
    it { should have_many(:votes) }
  end
end
