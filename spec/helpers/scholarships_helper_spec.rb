require 'spec_helper'

# Specs in this file have access to a helper object that includes
# the ScholarshipsHelper. For example:
#
# describe ScholarshipsHelper do
#   describe "string concat" do
#     it "concats two strings with spaces" do
#       helper.concat_strings("this","that").should == "this that"
#     end
#   end
# end
describe ScholarshipsHelper do
  describe "when filtering scholarship" do
    before :each do
      @bourse_aborigene_cycle_1 = Scholarship.create(:name => "Bourse cycle 1", :cycle => 1, :scholarship_type => "aboriginal")
      @bourse_cycle_2 = Scholarship.create(:name => "Bourse cycle 2", :cycle => 2, :type => "wasp")
      @bourse_cycle_3 = Scholarship.create(:name => "Bourse cycle 3", :cycle => 3)
      @bourse_postdoc = Scholarship.create(:name => "Bourse postdoc", :cycle => 4)
    end

    it "should returns all scholarship if not filter is applied" do
      ScholarshipsHelper.execute({}).should == Scholarship.all
    end

    describe "with cycles criteria" do
      it "should returns specified scholarships when using a single cycle criteria" do
        params = {:cycles => {:first => 1}}
        ScholarshipsHelper.execute(params).should == [@bourse_aborigene_cycle_1]
      end

      it "should return specified scholarships when using multiple cycles criteria" do
        params = {:cycles => {:first => 1, :postdoc => 4}}
        ScholarshipsHelper.execute(params).should == [@bourse_aborigene_cycle_1, @bourse_postdoc]
      end
    end

    describe "with types criteria" do
      it "should return specified scholarship when using a single types criteria" do
        params = {:types=> {:aboriginal => 'aboriginal'}}
        ScholarshipsHelper.execute(params).should == [@bourse_aborigene_cycle_1]
      end
    end

    describe "with cycle and type criteria" do
      it "should return the scholarship that matches both criteria" do
        params = {:cycles => {:first => 1},:types=> {:aboriginal => 'aboriginal'}}
        ScholarshipsHelper.execute(params).should == [@bourse_aborigene_cycle_1]
      end
    end
  end
end
