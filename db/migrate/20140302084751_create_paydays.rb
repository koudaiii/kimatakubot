class CreatePaydays < ActiveRecord::Migration
  def change
    create_table :paydays do |t|
      t.string :title
      t.text :twitter_acount_name
      t.date :payday

      t.timestamps
    end
  end
end
