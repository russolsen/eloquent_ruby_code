class AddBooks < ActiveRecord::Migration
  def self.up
    create_table :books do |t|
      t.string  :title
      t.integer :publisher_id
    end
  end

  def self.down
    drop_table :books
  end
end

