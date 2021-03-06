class StaticPagesController < ApplicationController
include SessionsHelper
  def home
	  	if logged_in?
	  		@user = current_user
	  		@entry = current_user.entries.build
			@comment = current_user.comments.build
      		@feed_items = current_user.feed.paginate(page: params[:page])

	  	else
	  		@home_entries = Entry.all.paginate(page: params[:page])
	  	end
  end

  def help
  end
end
