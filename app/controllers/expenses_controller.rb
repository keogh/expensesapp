class ExpensesController < ApplicationController
	before_filter :authenticate_user!

	def index
	end

	def create
		expense = Expense.new(params[:expense])
		if expense.save
			render :json => {success: true, message: 'Gasto creado.'}
		else
			render :json => {success: false, message: 'Hubo un error al crear el gasto. Intente de nuevo.'}
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