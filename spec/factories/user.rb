FactoryGirl.define do
  factory :user do
    name "Doanh Ho"
    email "doanhhnqt74@gmail.com"
    password "12345678"
    password_confirmation "12345678"
    confirmed_at Date.today
  end
end
