class CreateReleases < ActiveRecord::Migration
  def change
    create_table :releases do |t|
      t.string :title
      t.text :description
      t.date :release_at

      t.timestamps
    end
  end
end
