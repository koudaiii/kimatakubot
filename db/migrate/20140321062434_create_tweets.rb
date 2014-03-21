class CreateTweets < ActiveRecord::Migration
  def change
    create_table :tweets do |t|
      t.string :title
      t.text :tweet
      t.text :twitter_acount_name
      t.date :started_at
      t.date :ended_at

      t.timestamps
    end
  end
end
