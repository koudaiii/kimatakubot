class AddTitleToReleases < ActiveRecord::Migration
  def change
    add_column :releases, :title, :string
  end
end
