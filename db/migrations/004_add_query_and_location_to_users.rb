Sequel.migration do
  change do
    add_column :users, :query, String
    add_column :users, :location, String
  end
end
