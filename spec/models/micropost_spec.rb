require 'rails_helper'
<<<<<<< HEAD

RSpec.describe Micropost, type: :model do
=======
require 'spec_helper'

RSpec.describe Micropost, type: :model do


>>>>>>> user-microposts
  def setup
    @user = users(:michael)
    @micropost = @user.microposts.build(content: "Lorem ipsum")
  end

  test "should be valid" do
    assert @micropost.valid?
  end

  test "user id should be present" do
    @micropost.user_id = nil
    assert_not @micropost.valid?
  end

  test "content should be present" do
    @micropost.content = "   "
    assert_not @micropost.valid?
  end

  test "content should be at most 140 characters" do
    @micropost.content = "a" * 141
    assert_not @micropost.valid?
  end
<<<<<<< HEAD

    test "order should be most recent first" do
    assert_equal microposts(:most_recent), Micropost.first
  end
=======
  
  test "order should be most recent first" do
    assert_equal microposts(:most_recent), Micropost.first
  end

#Old version
#	describe Micropost do
#		let(:user) {FactoryGirl.create(:user)}
#		before do
#			@micropost = Micropost.new(content: "Lorem ipsum", user_id: user.id)
#	end

#	subject {@micropost}

#	it { should respond_to(:content)}
#	it { should respond_to(:user_id)}
>>>>>>> user-microposts
end
