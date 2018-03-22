namespace :db do
	desc "Fill database with sample data"
	task populate: :environment do
		User.create!(	name: "Example User",
						email: "test@test.org",
						password: "foobar",
						password_confirmation: "foobar")
		admin.toggle!(:admin)
		
		99.times do |n|
			name = Faker::Name.name
			email = "test-#{n+1}@exes.org"
			password = "password"
			User.create!(	name: name,
							email: email,
							password: password,
							password_confirmation: password)
		end
		users = User.order(:created_at).take(6)
		50.times do
		  content = Faker::Lorem.sentence(5)
		  users.each { |user| user.microposts.create!(content: content) }
		end
	end#task populate: :environment do
end#namespace :db do