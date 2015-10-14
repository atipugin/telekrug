Sequel.migration do
  change do
    add_column :users, :current_command, Integer
  end
end
