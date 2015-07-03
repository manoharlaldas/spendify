json.array!(@expenses) do |post|
  json.extract! :date, :id, :time, :description, :amount, :comment, :merchant, :category
  json.url expense_url(expense, format: :json)
end
