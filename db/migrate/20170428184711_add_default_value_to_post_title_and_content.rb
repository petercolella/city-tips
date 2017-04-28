class AddDefaultValueToPostTitleAndContent < ActiveRecord::Migration[5.0]
  def change
    change_column_default :posts, :content, ""
    change_column_default :posts, :title, ""
  end
end
