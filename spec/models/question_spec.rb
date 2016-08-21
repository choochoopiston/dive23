require 'rails_helper'

RSpec.describe Question, type: :model do

  #タイトルと内容が記入されていればOK 
  it "is valid with title, content, user_id" do
    question = FactoryGirl.build(:question, user_id: 1)
    expect(question).to be_valid
  end
  
  #タイトルと内容が記入されていなければNG
  it "is invalid without title, content" do
    question = FactoryGirl.build(:question, title: nil, content: nil, user_id: 1)
    expect(question).not_to be_valid
  end
  
  #タイトが記入されていなければNG
  it "is invalid without title" do
    question = FactoryGirl.build(:question, title: nil, user_id: 1)
    expect(question).not_to be_valid
  end
  
  #内容が記入されていなければNG
  it "is invalid without content" do
    question = FactoryGirl.build(:question, content: nil, user_id: 1)
    expect(question).not_to be_valid
  end
  
  #ユーザIDが記入されていなければNG
  it "is invalid without content" do
    question = FactoryGirl.build(:question)
    expect(question).not_to be_valid
  end
  
end