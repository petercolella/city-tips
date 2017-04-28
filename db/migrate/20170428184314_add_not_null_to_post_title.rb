class AddNotNullToPostTitle < ActiveRecord::Migration[5.0]
  def change
    change_column_null :posts, :title, :string, false
  end
end
