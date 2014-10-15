class AddPictureToBike < ActiveRecord::Migration
  def change
    add_column :bikes, :picture, :string
  end
end
