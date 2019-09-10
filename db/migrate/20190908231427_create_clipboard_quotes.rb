class CreateClipboardQuotes < ActiveRecord::Migration[6.0]
  def change
    create_table :clipboard_quotes do |t|
      t.integer :clipboard_id
      t.integer :quote_id

      t.timestamps
    end
  end
end
