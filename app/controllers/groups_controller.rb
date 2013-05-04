class GroupsController < ApplicationController

	def index
		# Temp method
		render :json => {:users => User.all}
	end

end