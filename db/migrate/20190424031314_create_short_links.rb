class CreateShortLinks < ActiveRecord::Migration[5.2]
  def change
    create_table :short_links do |t|
      t.references :user, null: false, index: true
      t.references :original_link, null: false, index: true
      t.string :short_url_code, null: false, index: { unique: true }

      t.timestamps
    end
  end
end
