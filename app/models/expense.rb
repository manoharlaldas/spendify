class Expense < ActiveRecord::Base
	belongs_to :user
	
	# validates_presence_of :merchant, :category
	 validates :user_id, presence: true
end
