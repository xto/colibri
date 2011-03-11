require 'spec_helper'

describe "scholarships/index.html.haml" do

  it "should have a label for each cycle checkbox" do

    assign :scholarships, []
    render

    view_content_for(:colonneGauche).should have_selector('form', :action => '/scholarships/search') do |form|
      form.should have_selector("#cycles") do |cycles|
        cycles.should have_selector("label", :for => "cycles_first_cycle")
        cycles.should have_selector("input", :id => "cycles_first_cycle", :name => 'cycles[first_cycle]')

        cycles.should have_selector("label", :for => "cycles_second_cycle")
        cycles.should have_selector("input", :id => "cycles_second_cycle", :name => 'cycles[second_cycle]')

        cycles.should have_selector("label", :for => "cycles_third_cycle")
        cycles.should have_selector("input", :id => "cycles_third_cycle", :name => 'cycles[third_cycle]')

        cycles.should have_selector("label", :for => "cycles_postdoc_cycle")
        cycles.should have_selector("input", :id => "cycles_postdoc_cycle", :name => 'cycles[postdoc_cycle]')
      end

    end
  end

  it "should provide a link to the online scholarship file" do
    assign :scholarships, [Scholarship.create!(:seq=>"123", :name=>"patate")]
    render

    view_content_for(:colonneCentreSection).should have_selector('tr', :id => 'seq_123') do |line|
      expected_link = "https://oraweb.ulaval.ca/pls/gpb/gpb100_fiche_bourse.consultation_fiche2?numero_concours=1&sequence_bourse=123&numero_repartition=1"
      line.should have_selector("a", :href => expected_link)
      line.should have_selector("a", :href => expected_link) do |link|
        link.should contain("patate")
      end
    end

  end

  it "should have a checkbox for all types" do
    assign :scholarships, []
    render

    view_content_for(:colonneGauche).should have_selector('form', :action => '/scholarships/search') do |form|
      form.should have_selector("#types") do |types|
        Scholarship::AVAILABLE_TYPES.each do |scholarship_type|
          types.should have_selector("input", :id => "types_#{scholarship_type}", :name => "types[#{scholarship_type}]")
        end
      end
    end
  end

  describe "scholarship information request" do
    before(:each) do
      @bourse_aborigene_cycle_1 = Scholarship.create(:name => "Bourse cycle 1", :cycle => 1, :seq => '1')
      @bourse_cycle_2 = Scholarship.create(:name => "Bourse cycle 2", :cycle => 2, :seq => '2')
    end

    it "should have a form for each scholarship" do
      assign :scholarships, Scholarship.all
      render

      view_content_for(:colonneCentreSection).should have_selector('tr', :id => 'seq_1') do |line|
        line.should have_selector('form', :id=>'form_for_scholarship_1') do |form|
          form.should have_selector('input', :name => 'scholarship_ids', :type => 'hidden', :value => '1')
          form.should have_selector('input', :type => 'text', :name => 'requester_address'  ,:value => '')
          form.should have_selector('input', :type=> 'submit', :value => I18n.t(:request_info_button))
        end
      end

      view_content_for(:colonneCentreSection).should have_selector('tr', :id => 'seq_2') do |line|
        line.should have_selector('form', :id=>'form_for_scholarship_2') do |form|
          form.should have_selector('input', :name => 'scholarship_ids', :type => 'hidden', :value => '2')
          form.should have_selector('input', :type => 'text', :name => 'requester_address'  ,:value => '')
          form.should have_selector('input', :type=> 'submit', :value => I18n.t(:request_info_button))
        end
      end

    end


  end
end
