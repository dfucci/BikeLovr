class AddPriceToBike < ActiveRecord::Migration
  def change
    add_column :bikes, :price, :BigDecimal
  end
end
