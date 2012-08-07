class DropAdminTables < ActiveRecord::Migration
  def up
  	drop_table :active_admin_comments
  	drop_table :admin_users
  end

  def down
  	create_table :admin_users do |t|
  		t.timespamps
	end
	create_table :active_admin_comments do |t|
  		t.timespamps
	end
  end
end
