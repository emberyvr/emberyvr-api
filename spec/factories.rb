FactoryGirl.define do
  factory :user do
    sequence :name do |i|
      "Test#{i}-User"
    end
    sequence :email do |i|
      "test#{i}@example.com"
    end
    password '12345678'
    password_confirmation '12345678'
  end
end
