require 'rails_helper'

RSpec.describe Question, type: :model do

  #タイトルと内容が記入されていればOK 
  it "is valid with title, content, user_id" do
    question = Question.new(title: "あああ", content: "いいい", user_id: 1)
    expect(question).to be_valid
  end
  
  #タイトルと内容が記入されていなければNG
  it "is invalid without title, content" do
    question = Question.new
    expect(question).not_to be_valid
  end
  
  #タイトが記入されていなければNG
  it "is invalid without title" do
    question = Question.new(content:"いいい", user_id: 1)
    expect(question).not_to be_valid
  end
  
  #内容が記入されていなければNG
  it "is invalid without content" do
    question = Question.new(title:"あああ", user_id: 1)
    expect(question).not_to be_valid
  end
  
  #ユーザIDが記入されていなければNG
  it "is invalid without content" do
    question = Question.new(title:"あああ", content:"いいい")
    expect(question).not_to be_valid
  end
  
end