FactoryGirl.define do 

  factory :like do 
    likeable_type {["Post", "Comment"].sample}
    likeable_id {likeable_type.constantize.all.sample.id}
    user


  end



end