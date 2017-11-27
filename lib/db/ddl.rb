require_relative './connection'

DB.drop_table? :posts

DB.create_table(:posts) do
  primary_key :id
  Integer     :number
  Numeric     :amount
  String      :status
end
