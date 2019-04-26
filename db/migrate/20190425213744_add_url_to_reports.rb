class AddUrlToReports < ActiveRecord::Migration[5.2]
  def change
    add_column :reports, :url, :string, null: false, index: { unique: true }
  end
end
