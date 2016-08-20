FactoryGirl.define do
  factory :question do
    user nil
    title "MyString"
    content "MyText"
    photo "MyString"
    favorite_counts 1
    posi_counts 1
    nega_counts 1
    unavailable_flag false
  end
end
