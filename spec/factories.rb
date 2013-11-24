FactoryGirl.define do
  factory :user do
    name      "Thomas McLachlan"
    email     "thomas@example.com"
    password  "foobar"
    password_confirmation "foobar"
  end
end