class ExpenseSerializer < ActiveModel::Serializer
  attributes :id, :time, :date, :comment, :amount, :description, :category, :merchant
end