class AddTypeToScholarships < ActiveRecord::Migration
  def self.up
    add_column :scholarships, :scholarship_type, :string
  end

  def self.down
    remove_column :scholarships, :scholarship_type
  end
end
