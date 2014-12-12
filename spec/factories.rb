FactoryGirl.define do  
    
  factory :comment do
    user
    sequence (:comment) { |n| "My awesome comment #{n}" }
    association :idea, factory: :idea
  end

  factory :idea do
    name "Ismael's Idea"
    factory :published_idea do
      published true
    end
    description "Awesome idea"
    keyword "key"
    factory :idea_with_comments do
      published true
      after(:create) do |idea, evaluator| 
        create_list(:comment, 3, idea: idea)
      end
    end
  end
  factory :user do
    sequence (:email) { |n| "john.doe#{n}@example.com" }
    password '12345678'
    factory :entrepreneur do
      roles "entrepreneur"
    end
    factory :moderator do
      roles "moderator"
    end
  end

  factory :admin, class: User do
    email 'admin@admin.com'
    password '12345678'
    roles "admin"
  end   

end
