class AddCategoryRefToProduct < ActiveRecord::Migration[5.0]
  def change
    add_reference :products, :category, foreign_key: true
    # add_column :products, :category_id, :integer
  end
end
