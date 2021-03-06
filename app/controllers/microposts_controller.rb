class MicropostsController < ApplicationController

	before_filter :signed_in_user, only: [:create, :detroy]
	before_filter :correct_user, only: :destroy

	def create
	    @micropost = current_user.microposts.build(micropost_params)
	    if @micropost.save
	      flash[:success] = "Micropost created!"
	      redirect_to root_url
	    else
	      @feed_items = []
	      render 'static_pages/home'
	    end
	end

	def destroy
	    @micropost.destroy
	    flash[:success] = "Micropost deleted"
	    redirect_to request.referrer || root_url
	end

	def correct_user
		@micropost = current_user.microposts.find_by_id(params[:id])
		redirect_to root_path if @micropost.nil?
	end

	private

    def micropost_params
      params.require(:micropost).permit(:content)
    end
end