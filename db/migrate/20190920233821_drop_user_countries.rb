class DropUserCountries < ActiveRecord::Migration[6.0]
  def change
    drop_table :user_countries
  end
end
