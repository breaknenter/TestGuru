class AddNameAndTypeToUsers < ActiveRecord::Migration[6.0]
  def self.up
    add_column :users, :type,       :string, null: false, default: "User"
    add_column :users, :first_name, :string, null: false
    add_column :users, :last_name,  :string, null: false

    add_index  :users, :type
  end

  def self.down
    remove_columns :users,
                   :type,
                   :first_name,
                   :last_name
  end
end
