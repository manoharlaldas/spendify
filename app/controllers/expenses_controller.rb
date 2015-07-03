class ExpensesController < ApplicationController
   # before_action :set_expense, only: [:show, :edit, :update, :destroy]

   #GET /expenses/1
	def show
		# @expense = Expense.find(params[:id])
  #           respond_to do |format|
  #           format.html
  #           format.xml {render :xml => @expense }
        # end
	end

    #GET /expenses/new
    def new
          @expense = Expense.new#(params[:expense])
    end
    # GET /expenses/1/edit
    def edit
    end

	def index
		 # @expenses = Expense.where(user_id: params[:user_id])
		 @expenses = Expense.all
         # render json: @exepenses	
	end
    # POST /expenses
    # POST /expenses.json
	def create
        @expenses = Expense.new(expense_params)
        @expenses.user= current_user     
       binding.pry
		   if @expenses.save
			redirect_to expenses_path, notice: 'Post was successfully created.'
		   else
			render 'new'
		   end     
	end
    

    #DELETE /expenses/1
    #DELETE /expenses/1.json
    def destroy
    	@expense.destroy
    	respond_to do |format|
    		format.html { redirect_to expenses_url, notice: 'Post was successfully destroyed.' }
            format.json { head :no_content }
    	end	
    end


    private 

     def set_expense
      @expense = Expense.find(params[:id])
     end


	def expense_params
		params.require(:expense).permit(:merchant, :comment, :category, :user_id, :total, :date)
	end
end
