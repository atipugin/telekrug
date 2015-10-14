Sequel.migration do
  change do
    add_column :users, :enabled, TrueClass, null: false, default: true
  end
end
