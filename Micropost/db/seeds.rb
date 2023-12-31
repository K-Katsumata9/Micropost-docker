# ユーザー
User.create!(name:  "K Katsumata",
             email: "sample@gmail.com",
             password:              "foobar",
             password_confirmation: "foobar",
						 admin: true,
						 activated: true,
             activated_at: Time.zone.now)

99.times do |n|
  name  = Faker::Name.name
  email = "sample-#{n+1}@gmail.com"
  password = "foobar"
  User.create!(name:  name,
               email: email,
               password:              password,
               password_confirmation: password,
							 activated: true,
               activated_at: Time.zone.now)
end

# マイクロポスト
users = User.order(:created_at).take(6)
50.times do
	content = Faker::Lorem.sentence(word_count: 5)
	users.each do |user| 
		user.microposts.create!(content: content)
	end
end

# リレーションシップ
users = User.all
user  = users.first
following = users[2..50]
followers = users[3..40]
following.each { |followed| user.follow(followed) }
followers.each { |follower| follower.follow(user) }