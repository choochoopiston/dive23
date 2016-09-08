require 'rails_helper'

RSpec.describe Answer, type: :model do
  describe 'Association' do
    it { should belong_to(:question) }
    it { should belong_to(:user) }
    it { should have_many(:votes) }
  end   
  
  describe 'Validation' do
    #内容が入力されていればOK 
    it "is valid with content" do
      answer = build(:answer)
      expect(answer).to be_valid
    end
    
    #内容が記入されていなければNG
    it "is invalid without content" do
      answer = build(:answer, content: nil)
      expect(answer).not_to be_valid
    end
    
  end
  
end
