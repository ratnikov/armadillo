class CreateFilters < ActiveRecord::Migration
  def self.up
    create_table :filters do |t|
      t.string :query
      t.belongs_to :user

      t.timestamps
    end
  end

  def self.down
    drop_table :filters
  end
end
