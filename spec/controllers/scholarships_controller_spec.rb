require 'spec_helper'

describe ScholarshipsController do

  describe "POST 'search'" do
    describe "with 1st and 2nd cycle filters" do
      before(:each) do
        @bourse_aborigene_cycle_1 = Scholarship.create(:name => "Bourse cycle 1", :cycle => 1)
        @bourse_cycle_2 = Scholarship.create(:name => "Bourse cycle 2", :cycle => 2)
        @bourse_cycle_3 = Scholarship.create(:name => "Bourse cycle 3", :cycle => 3)
        @bourse_postdoc = Scholarship.create(:name => "Bourse postdoc", :cycle => 4)
      end

      it "should return only the scholarships of 1st or 2nd cycle" do
        post :search, :cycles => {:first_cycle => '1', :second_cycle => '2'}

        assigns(:scholarships).should include(@bourse_aborigene_cycle_1)
        assigns(:scholarships).should include(@bourse_cycle_2)

        assigns(:scholarships).should_not include(@bourse_cycle_3)
        assigns(:scholarships).should_not include(@bourse_postdoc)
      end

      it "should return the scholarship for 1st cycle students of aboriginal descent" do
        @bourse_cycle_1_autochtone = Scholarship.create(:name => "Bourse cycle 1 autochtone", :cycle => 1, :scholarship_type => 'aboriginal')
        post :search, :cycles => {:first_cycle => '1'}, :types => {:aboriginal => 'aboriginal' }

        assigns(:scholarships).should include(@bourse_cycle_1_autochtone)

        assigns(:scholarships).should_not include(@bourse_aborigene_cycle_1)
        assigns(:scholarships).should_not include(@bourse_cycle_2)
        assigns(:scholarships).should_not include(@bourse_cycle_3)
        assigns(:scholarships).should_not include(@bourse_postdoc)
      end

      it "should not fail if filtering only based on type" do
        lambda{post :search, :types => {:aboriginal => 'aboriginal' }}.should_not raise_error
      end

    end

    describe "filtering criteria" do
      it "should remember the selected cycle filters" do
        post :search, :cycles => {:first_cycle => '1', :second_cycle => '2'}

        assigns(:selected_cycles).should == {"first_cycle" => '1', "second_cycle"=> '2'}
      end
    end
  end

  describe "POST scholarship_info_request" do
    before(:each) do
      @bourse_aborigene_cycle_1 = Scholarship.create(:name => "Bourse cycle 1", :cycle => 1, :seq => '1')
      @bourse_cycle_2 = Scholarship.create(:name => "Bourse cycle 2", :cycle => 2, :seq => '2')
    end

    it "should make a call to the mailer" do
      @mock = double()
      UserMailer.should_receive(:scholarship_info_request).with("someone@large.sea",[@bourse_aborigene_cycle_1]).and_return(@mock)
      @mock.should_receive(:deliver)
      
      post :scholarship_info_request, :requester_address => "someone@large.sea", :selected_scholarships => {@bourse_aborigene_cycle_1.seq => "on"}
    end

    it "should redirect to the index action" do
      post :scholarship_info_request, :requester_address => "someone@large.sea", :selected_scholarships => {@bourse_aborigene_cycle_1.seq => "on"}

      response.should redirect_to "/scholarships"
    end



  end

end
