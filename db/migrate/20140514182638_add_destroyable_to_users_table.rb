class AddDestroyableToUsersTable < ActiveRecord::Migration
  def change
  	 add_column :users, :destroyable, :boolean
  end
end
