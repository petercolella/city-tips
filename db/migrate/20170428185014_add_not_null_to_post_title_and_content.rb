class AddNotNullToPostTitleAndContent < ActiveRecord::Migration[5.0]
  def change
    change_column_null :posts, :title, false
    change_column_null :posts, :content, false
  end
end
