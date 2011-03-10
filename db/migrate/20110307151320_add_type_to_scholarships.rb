class AddTypeToScholarships < ActiveRecord::Migration
  def self.up
    add_column :scholarships, :scholarship_type, :string
    Scholarship.reset_column_information

    unless RAILS_ENV == "test"
      puts "-- update some scholarship types"

      Scholarship.find_by_seq(2).update_attributes(:scholarship_type=>"excellence")
      name = Scholarship.find_by_seq(2).name
      type = Scholarship.find_by_seq(2).scholarship_type
      puts "   -> sample: name=" + name.to_s + ", type=" + type.to_s

      Scholarship.find_by_seq(3).update_attributes(:scholarship_type=>"excellence")
      Scholarship.find_by_seq(8).update_attributes(:scholarship_type=>"excellence")
      Scholarship.find_by_seq(11).update_attributes(:scholarship_type=>"excellence")
      Scholarship.find_by_seq(12).update_attributes(:scholarship_type=>"excellence")
      Scholarship.find_by_seq(13).update_attributes(:scholarship_type=>"ancestry")
      Scholarship.find_by_seq(16).update_attributes(:scholarship_type=>"excellence")
      Scholarship.find_by_seq(20).update_attributes(:scholarship_type=>"ancestry_and_territory")
      Scholarship.find_by_seq(23).update_attributes(:scholarship_type=>"excellence")
      Scholarship.find_by_seq(24).update_attributes(:scholarship_type=>"excellence, ancestry_and_territory")
      Scholarship.find_by_seq(26).update_attributes(:scholarship_type=>"excellence")
      Scholarship.find_by_seq(27).update_attributes(:scholarship_type=>"excellence")
      Scholarship.find_by_seq(43).update_attributes(:scholarship_type=>"excellence")
      Scholarship.find_by_seq(44).update_attributes(:scholarship_type=>"excellence")
      Scholarship.find_by_seq(53).update_attributes(:scholarship_type=>"excellence")
      Scholarship.find_by_seq(76).update_attributes(:scholarship_type=>"ancestry_and_territory")
      Scholarship.find_by_seq(87).update_attributes(:scholarship_type=>"excellence")
      Scholarship.find_by_seq(93).update_attributes(:scholarship_type=>"excellence")

      Scholarship.find_by_seq(110).update_attributes(:scholarship_type=>"excellence")
      Scholarship.find_by_seq(117).update_attributes(:scholarship_type=>"excellence, aboriginal")
      Scholarship.find_by_seq(118).update_attributes(:scholarship_type=>"excellence")
      Scholarship.find_by_seq(120).update_attributes(:scholarship_type=>"aboriginal")
      Scholarship.find_by_seq(127).update_attributes(:scholarship_type=>"excellence")
      Scholarship.find_by_seq(129).update_attributes(:scholarship_type=>"aboriginal")

      Scholarship.find_by_seq(135).update_attributes(:scholarship_type=>"excellence")

      Scholarship.find_by_seq(159).update_attributes(:scholarship_type=>"ancestry_and_territory")
      Scholarship.find_by_seq(160).update_attributes(:scholarship_type=>"excellence")
      Scholarship.find_by_seq(163).update_attributes(:scholarship_type=>"excellence")
      Scholarship.find_by_seq(167).update_attributes(:scholarship_type=>"woman")
      Scholarship.find_by_seq(182).update_attributes(:scholarship_type=>"excellence")
      Scholarship.find_by_seq(186).update_attributes(:scholarship_type=>"excellence")
      Scholarship.find_by_seq(188).update_attributes(:scholarship_type=>"excellence")
      Scholarship.find_by_seq(194).update_attributes(:scholarship_type=>"excellence")
      Scholarship.find_by_seq(205).update_attributes(:scholarship_type=>"excellence")
      Scholarship.find_by_seq(219).update_attributes(:scholarship_type=>"ancestry_and_territory")
      Scholarship.find_by_seq(231).update_attributes(:scholarship_type=>"excellence")
      Scholarship.find_by_seq(242).update_attributes(:scholarship_type=>"excellence")
      Scholarship.find_by_seq(261).update_attributes(:scholarship_type=>"excellence")
      Scholarship.find_by_seq(265).update_attributes(:scholarship_type=>"excellence")
      Scholarship.find_by_seq(272).update_attributes(:scholarship_type=>"ancestry_and_territory")
      Scholarship.find_by_seq(275).update_attributes(:scholarship_type=>"excellence")
      Scholarship.find_by_seq(280).update_attributes(:scholarship_type=>"excellence")
      Scholarship.find_by_seq(283).update_attributes(:scholarship_type=>"excellence")

      Scholarship.find_by_seq(294).update_attributes( :scholarship_type=>"excellence")
      Scholarship.find_by_seq(296).update_attributes( :scholarship_type=>"excellence")
      Scholarship.find_by_seq(458).update_attributes( :scholarship_type=>"excellence, ancestry_and_territory")
      Scholarship.find_by_seq(466).update_attributes( :scholarship_type=>"excellence")
      Scholarship.find_by_seq(467).update_attributes( :scholarship_type=>"excellence, aboriginal")
      Scholarship.find_by_seq(470).update_attributes( :scholarship_type=>"excellence")
      Scholarship.find_by_seq(472).update_attributes( :scholarship_type=>"excellence")
      Scholarship.find_by_seq(482).update_attributes( :scholarship_type=>"excellence")

      
    end
  end

  def self.down
    remove_column :scholarships, :scholarship_type
  end
end
