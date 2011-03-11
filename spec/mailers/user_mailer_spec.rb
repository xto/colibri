require "spec_helper"

describe UserMailer do
  describe "scholarship_info_request" do
    before :each do
      @bourse_aborigene_cycle_1 = Scholarship.create(:name => "Bourse cycle 1", :cycle => 1, :scholarship_type => 'aboriginal')
      @bourse_cycle_2 = Scholarship.create(:name => "Bourse cycle 2", :cycle => 2)
      @bourse_cycle_3 = Scholarship.create(:name => "Bourse cycle 3", :cycle => 3)
      @bourse_postdoc = Scholarship.create(:name => "Bourse postdoc", :cycle => 4)
      @mail =  UserMailer.scholarship_info_request("someone@earth.milkyway.uni", Scholarship.all)
    end
    it "renders the headers" do
      @mail.subject.should eq(I18n.t("user_mailer.scholarship_info_request.subject"))
      @mail.to.should eq([SCHOLARSHIP_INFO_REQUEST_DEFAULT_RECEIVER])
      @mail.from.should eq(["colibri@bbaf.ulaval.ca"])
    end

    it "renders the body" do
      @mail.body.encoded.should have_selector("#content") do |content|
        #content.html.should include("someone@earth.milkyway.uni would like more information on the following scholarship(s):")

        content.should have_selector("ul") do |list|
          Scholarship.all.each do |scholarship|
            list.should have_selector("li", :content => scholarship.name)
          end
        end

      end
    end
  end
end
