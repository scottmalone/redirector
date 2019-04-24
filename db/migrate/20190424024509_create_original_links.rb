class CreateOriginalLinks < ActiveRecord::Migration[5.2]
  def change
    create_table :original_links do |t|
      t.string :original_url, null: false, index: {unique: true}
      t.integer :short_links_count

      t.timestamps
    end
  end
end
