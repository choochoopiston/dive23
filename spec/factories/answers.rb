FactoryGirl.define do
  factory :answer do
    sequence(:question_id) {|n| n + 1} 
    sequence(:user_id) {|n| n + 1}
    content "MyText"
    photo "MyString"
  end
end
