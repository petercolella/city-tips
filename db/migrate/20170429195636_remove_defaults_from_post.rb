class RemoveDefaultsFromPost < ActiveRecord::Migration[5.0]
  def change
    change_column_default :posts, :content, nil
    change_column_default :posts, :title, nil
  end
end
