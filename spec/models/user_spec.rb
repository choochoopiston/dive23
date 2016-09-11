require 'rails_helper'

RSpec.describe User, type: :model do
  
  describe 'Validation' do
    #名前とメールアドレスとパスワードが入力されていれば有効
    it "is valid with name" do
      user = build(:user)
      expect(user).to be_valid
    end
    #名前が入力されていなければ無効
    it "is invalid without name" do
      user = build(:user, name: nil)
      expect(user).not_to be_valid
    end
    #メールアドレスが入力されていなければ無効
    it "is invalid without email" do
      user = build(:user, email: nil)
      expect(user).not_to be_valid
    end
    #パスワードが入力されていなければ無効
    it "is invalid without password" do
      user = build(:user, password: nil)
      expect(user).not_to be_valid
    end
  end
  
  describe 'Association' do
    it { should have_many(:answers) }
    it { should have_many(:favorites) }
    it { should have_many(:votes) }
    it { should have_many(:questions) }
  end
end
