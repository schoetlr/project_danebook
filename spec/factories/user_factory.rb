FactoryGirl.define do 

  factory :user do 
    #{} around faker line causing stack level too deep
    email {Faker::Internet.safe_email}#"awesomeemail@email.com"
    password "password"
    password_confirmation "password"
    profile

  end

end