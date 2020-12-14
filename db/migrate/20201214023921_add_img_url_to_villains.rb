class AddImgUrlToVillains < ActiveRecord::Migration[6.0]
  def change
    add_column :villains, :img_url, :string
  end
end
