class AddImgUrlToHeros < ActiveRecord::Migration[6.0]
  def change
    add_column :heros, :img_url, :string
  end
end
