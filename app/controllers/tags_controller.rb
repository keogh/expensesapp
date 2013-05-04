class TagsController < ApplicationController

	def index
		tags = Tag.all.map do |tag|
			{
				id: tag.id,
				text: tag.name
			}
		end
		render :json => {:tags => tags }
	end
end