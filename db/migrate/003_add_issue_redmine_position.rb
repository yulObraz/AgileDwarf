class AddIssueRedminePosition < ActiveRecord::Migration
  def self.up
	if !column_exists?(:issues, :position)
	    add_column :issues, :position, :integer, :null => true, :default => nil
	    add_index :issues, :position
	end
  end
end
