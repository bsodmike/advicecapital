class AddRemoteImageUrlToEmployees < ActiveRecord::Migration
  def change
    add_column :employees, :remote_image_url, :string
  end
end
