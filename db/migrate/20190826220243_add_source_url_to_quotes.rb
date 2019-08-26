class AddSourceUrlToQuotes < ActiveRecord::Migration[6.0]
  def change
    add_column :quotes, :source_url, :string
  end
end
