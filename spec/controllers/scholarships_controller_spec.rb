require 'spec_helper'

describe ScholarshipsController do

  describe "POST 'search'" do
    describe "with 1st and 2nd cycle filters" do
      before(:each) do
        @bourse_cycle_1 = Scholarship.create(:name => "Bourse cycle 1", :cycle => 1)
        @bourse_cycle_2 = Scholarship.create(:name => "Bourse cycle 2", :cycle => 2)
        @bourse_cycle_3 = Scholarship.create(:name => "Bourse cycle 3", :cycle => 3)
        @bourse_postdoc = Scholarship.create(:name => "Bourse postdoc", :cycle => 4)
      end

      it "should return only the scholarships of 1st or 2nd cycle" do
        post :search, :cycles => {:first_cycle => '1', :second_cycle => '2'}

        assigns(:scholarships).should include(@bourse_cycle_1)
        assigns(:scholarships).should include(@bourse_cycle_2)

        assigns(:scholarships).should_not include(@bourse_cycle_3)
        assigns(:scholarships).should_not include(@bourse_postdoc)
      end
    end
  end

end
