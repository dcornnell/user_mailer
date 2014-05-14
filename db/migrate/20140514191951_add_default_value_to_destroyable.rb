class AddDefaultValueToDestroyable < ActiveRecord::Migration
  def change
  	change_column :users, :destroyable, :boolean, :default => true
  end
end
