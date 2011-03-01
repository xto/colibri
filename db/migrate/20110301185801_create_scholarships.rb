class CreateScholarships < ActiveRecord::Migration
  def self.up
    create_table :scholarships do |t|
      t.string :name
      t.string :cycle

      t.timestamps
    end
  end

  def self.down
    drop_table :scholarships
  end
end
