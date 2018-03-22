require 'rails_helper'
require 'spec_helper'

RSpec.describe "MicropostPages", type: :request do
  describe "GET /micropost_pages" do
    subject { page }

    let(:user) { FactoryGirl.create(:user)}
    before { sign_in user}

    describe "micropost creation" do
    	before { visit root_path }

    	describe "with invalid information" do

    		it "should not create a micropost" do
    			expect { click_button "Post"}.should_not change(Micropost, :count)
    		end

    		describe "error  messages" do
    			before {click_button "Post"}
    			it { should have_content ('error')}
    		end
    	end#"with invalid information" do

    	describe "with valid information" do

    		before { fill_in 'micropost_content', with: "Lorem ipsum"}
    		it "should create a micropost" do
    			expect { click_button "Post"}.should change(Micropost, :count).by(1)
    		end
    	end#"with valid information" do
    end#"micropost creation" do

    describe "micropost destruction" do
        before {FactoryGirl.create(:micropost, user: user)}

        describe "as correct user" do
            before { visit root_path}

            it "should delete a micropost" do
                expect { click_link "delete"}.should change(Micropost, :count).by(-1)
            end
        end
    end#"micropost destruction" do
  end#"GET /micropost_pages" do
end#RSpec.describe "MicropostPages", type: :request do
