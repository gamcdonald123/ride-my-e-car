class AddImageUrlToCar < ActiveRecord::Migration[7.1]
  def change
    add_column :cars, :image_url, :string
  end
end
