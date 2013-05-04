class ExpensesController < ApplicationController
	before_filter :authenticate_user!

	def index
		respond_to do |format|
			format.html do
				@tags  = Tag.all.map do |tag|
					{
						id: tag.id,
						text: tag.name
					}
				end
			end
		end
	end

	def create
		begin
			ActiveRecord::Base.transaction do
				expense = Expense.new(params[:expense])
				expense.creator_id = current_user.id

				params[:tags].each do |tag|
					begin
						expense.tags.push Tag.find(tag[:id])
					rescue
						expense.tags.push Tag.new(:name => tag[:text])
					end
				end

				if expense.save
					render :json => {success: true, message: 'Gasto creado.'}
				else
					raise 'Hubo un error al crear el gasto. Intente de nuevo.'
				end
			end
		rescue Exception => e
			render :json => {success: false, message: e.message}
		end
	end

	def filter
		now = Time.now
		date_low = now.strftime('%Y-%m-01')
		date_high = now.strftime("%Y-%m-#{view_context.days_in_month(now.month)}")

		expenses = Expense.where(:date => date_low..date_high).order("date ASC")
		render :json => {success: true, expenses: expenses}
	end
end