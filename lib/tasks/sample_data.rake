namespace :db do
	desc "Fill database with sample data"
	task populate: :environment do
		User.create!(	name: "Example User",
						email: "test@exes.org",
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
	end
end