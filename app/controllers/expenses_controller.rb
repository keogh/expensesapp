class ExpensesController < ApplicationController
	def index
	end

	def new
		render :json => {success: true, message: 'Hola mundo'}
	end

	def create
		expense = Expense.new(params[:expense])
		if expense.save
			render :json => {success: true, message: 'Gasto creado.'}
		else
			render :json => {success: false, message: 'Hubo un error al crear el gasto. Intente de nuevo.'}
		end
	end
end