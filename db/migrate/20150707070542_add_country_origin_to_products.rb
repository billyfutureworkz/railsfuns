class AddCountryOriginToProducts < ActiveRecord::Migration
  def change
    add_column :products, :country_origin, :string
  end
end
