class HomesController < ApplicationController
	
	def index
        if current_user_id
           @current_user = current_user
           @expense = @current_user.expense.build
           @expenses = @current_user.expense.paginate(page: params[:page])
        else
        	@expenses = Expense.all.paginate(page: params[:page])
        end
    end	
end
