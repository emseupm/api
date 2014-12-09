FactoryGirl.define do  
    
  factory :comment do
       
  end

  factory :idea do
    name "Ismael's Idea"
    factory :published_idea do
      published true
    end
    description "Awesome idea"
    keyword "key"
  end

  factory :user do
    sequence (:email) { |n| "john.doe#{n}@example.com" }
    password '12345678'
    admin false
  end

  factory :admin, class: User do
    email 'admin@admin.com'
    password '12345678'
    admin true
  end   

end
