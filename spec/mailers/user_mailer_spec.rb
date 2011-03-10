require "spec_helper"

describe UserMailer do
  describe "scholarship_info_request" do
    let(:mail) { UserMailer.scholarship_info_request }

    it "renders the headers" do
      mail.subject.should eq("Scholarship info request")
      mail.to.should eq(["to@example.org"])
      mail.from.should eq(["from@example.com"])
    end

    it "renders the body" do
      mail.body.encoded.should match("Hi")
    end
  end

end
