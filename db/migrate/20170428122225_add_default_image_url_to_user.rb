class AddDefaultImageUrlToUser < ActiveRecord::Migration[5.0]
  def change
    change_column_default :users, :image_url, 'https://d30y9cdsu7xlg0.cloudfront.net/png/15724-200.png'
  end
end
