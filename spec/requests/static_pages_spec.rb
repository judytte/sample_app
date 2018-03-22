require 'spec_helper'

describe "static pages" do

	subject { page }

	describe "Home page" do
		before (visit root_path)

		it should have_selector('h1', :text => 'Sample App')
		it should have_selector('title', 
				:text => "Ruby on Rails Tutorial Sample App")
		it should have_selector('title', :text => " | Home")

		describe "for signed-in users" do
			let(:user) {FactoryGirl.create(:user)}
			before do
				FactoryGirl.create(:micropost, user: user, content: "Lorem ipsum")
				FactoryGirl.create(:micropost, user: user, content: "Dolor sit amet")
				sign_in user
				visit root_path
			end
			it "should render the user's feed" do
				user.feed.each do |item|
					page.should have_selector("li##{item.id}", text: item.content)
				end
			end
			describe "follower/following counts" do
				let(:other_user) { FactoryGirl.create(:user)}
				before do
					other_user.follow!(user)
					visit root_path
				end

				it { should have_link("0 following", href: following_user_path(user))}
				it { should have_link("0 follower", href: followers_user_path(user))}
			end
	end

	describe "Help page" do
		before (visit root_path)

		it should have_selector('h1', :text => 'Help')
		it should have_selector('title', 
				:text => "Ruby on Rails Tutorial Sample App | Help")
	end

	describe "About page" do
		before (visit root_path)

		it should have_selector('h1', :text => 'About us')
		it should have_selector('title', 
				:text => "Ruby on Rails Tutorial Sample App | About us")
	end

	describe "Contact page" do
		before (visit root_path)
		it should have_selector('h1', :text => 'Contact')
		it should have_selector('title',
				:text => "Ruby on Rails Tutorial Sample App | Contact")
	end

end