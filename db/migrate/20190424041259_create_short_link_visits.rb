class CreateShortLinkVisits < ActiveRecord::Migration[5.2]
  def change
    create_table :short_link_visits do |t|
      t.references :short_link, foreign_key: true

      t.timestamps
    end
  end
end
