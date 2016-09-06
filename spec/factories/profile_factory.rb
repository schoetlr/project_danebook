FactoryGirl.define do 

  factory :profile do 

    phone Faker::PhoneNumber.phone_number
    college Faker::University.name
    hometown Faker::Address.city
    current_location Faker::Address.city
    about "This is an about me"
    words_to_live_by "These are words to live by"
    first_name {Faker::Name.name}
    last_name {Faker::Name.name}
    gender ["male", "female"].sample
    user


  end


end