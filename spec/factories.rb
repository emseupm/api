FactoryGirl.define do
  factory :user do
    email 'john.doe@example.com'
    password '12345678'
    admin false
  end

  factory :admin, class: User do
    email 'admin@admin.com'
    password '12345678'
    admin true
  end   

end
