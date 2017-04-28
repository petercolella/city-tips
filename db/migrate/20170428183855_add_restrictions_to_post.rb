class AddRestrictionsToPost < ActiveRecord::Migration[5.0]
  def change
    change_column :posts, :title, :string, :limit => 200
    change_column_null :posts, :title, :string, false
  end
end
