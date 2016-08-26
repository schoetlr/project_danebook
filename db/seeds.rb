# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)


Comment.destroy_all
User.destroy_all
Post.destroy_all
Like.destroy_all
Profile.destroy_all

puts "creating users"
5.times do 
  u = User.create(email: Faker::Internet.safe_email,
              password: "password",
              password_confirmation: "password")
  
  u.build_profile(phone: Faker::PhoneNumber.phone_number,
                  birthday: Time.now,
                  college: Faker::University.name,
                  hometown: Faker::Address.city,
                  current_location: Faker::Address.city,
                  about: "This is an about me", 
                  words_to_live_by: "These are words to live by",
                  first_name: Faker::Name.name,
                  last_name: Faker::Name.name,
                  gender: ["male", "female"].sample
                  )
end

def random_user_id
  User.all.sample.id
end
puts "creating posts"
50.times do 
  Post.create(:user_id => random_user_id,
              content: Faker::Lorem.paragraph)

end

def random_post_id
  Post.all.sample.id
end
puts "creating comments"
50.times do 
  Comment.create(user_id: random_user_id,
                post_id: random_post_id,
                content: Faker::Lorem.paragraph)

end

def like_params
  type = ["Post", "Comment"].sample
  id = type.constantize.all.sample.id
  user_id = 1
  while Like.all.map {|like| like.user_id }.include?(user_id)
    user_id = User.all.sample.id
  end

  {
    likeable_type: type,
    likeable_id: id,
    user_id: 1,

  }
end

puts 'creating likes'
50.times do 
  Like.create(like_params)
end