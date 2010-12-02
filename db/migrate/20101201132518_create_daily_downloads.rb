class CreateDailyDownloads < ActiveRecord::Migration
  def self.up
    create_table :daily_downloads do |t|
      t.time :read_time
      t.integer :page_limit
      t.string :title
      
      t.timestamps
    end
  end

  def self.down
    drop_table :daily_downloads
  end
end
