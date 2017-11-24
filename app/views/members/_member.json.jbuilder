json.extract! member, :id, :code, :firstname, :lastname, :nickname, :member_type, :bdate, :regisdate, :expdate, :pc_amount, :pc_balance, :created_at, :updated_at
json.url member_url(member, format: :json)
