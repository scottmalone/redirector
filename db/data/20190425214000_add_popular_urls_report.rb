class AddPopularUrlsReport < ActiveRecord::Migration[5.2]
  def up
    Report.create_with(
      name: 'Popular URLs'
    ).find_or_create_by(url: 'popular-urls')
  end

  def down
    Report.find_by(url: 'popular-urls').destroy
  end
end
