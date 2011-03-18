require 'spec_helper'

describe "scholarships/index.html.haml" do
  describe "Filtering form" do
    before :each do
      assign :scholarships, Scholarship.page
      assign :selected_cycles, {}
      assign :selected_types, {}
    end

    it "should have a label for each cycle checkbox" do
      render

      view_content_for(:colonneGauche).should have_selector('form', :action => '/scholarships') do |form|
        form.should have_selector("#cycles") do |cycles|
          cycles.should have_selector("label", :for => "all_cycles")
          cycles.should have_selector("input", :type =>"radio", :name=> "all_cycles")

          Scholarship::AVAILABLE_CYCLES.each do |cycle, value|
            cycles.should have_selector("label", :for => "cycles_#{cycle}")
            cycles.should have_selector("input", :id => "cycles_#{cycle}", :name => "cycles[#{cycle}]")
          end
        end

      end
    end

    it "should provide a link to the online scholarship file" do
      Scholarship.create!(:seq=>"123", :name=>"patate")
      assign :scholarships, Scholarship.page
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
      render

      view_content_for(:colonneGauche).should have_selector('form', :action => '/scholarships') do |form|
        form.should have_selector("#types") do |types|
          Scholarship::AVAILABLE_TYPES.each do |scholarship_type|
            types.should have_selector("input", :id => "types_#{scholarship_type}", :name => "types[#{scholarship_type}]")
          end
        end
      end
    end

    it "should keep the status of the cycle checkboxes between filter" do
      assign :selected_cycles, {"first_cycle" => "1"}
      render

      view_content_for(:colonneGauche).should have_selector('form', :action => '/scholarships') do |form|
        form.should have_selector("input", :id => "cycles_first_cycle", :name => 'cycles[first_cycle]', :checked => 'checked')
      end
    end

    it "should keep the status of the type checkboxes between filter" do
      assign :selected_types, {"aboriginal" => "aboriginal"}
      render

      view_content_for(:colonneGauche).should have_selector('form', :action => '/scholarships') do |form|
        form.should have_selector("input", :id => "types_aboriginal", :name => 'types[aboriginal]', :checked => 'checked')
      end
    end
  end


  describe "scholarship information request" do
    before(:each) do
      @bourse_aborigene_cycle_1 = Scholarship.create(:name => "Bourse cycle 1", :cycle => 1, :seq => '1')
      @bourse_cycle_2 = Scholarship.create(:name => "Bourse cycle 2", :cycle => 2, :seq => '2')

      assign :scholarships, Scholarship.page
      assign :selected_cycles, {}
      assign :selected_types, {}
    end

    it "should have a form for each scholarship" do
      render

      view_content_for(:colonneCentreSection).should have_selector('form', :id=>'form_for_scholarship_info') do |form|
          form.should have_selector('input', :type => 'text', :name => 'requester_address'  ,:value => '')
          form.should have_selector('input', :type=> 'submit', :value => I18n.t(:request_info_button))
          form.should have_selector('input', :name => 'selected_scholarships[1]', :type => 'checkbox')
          form.should have_selector('input', :name => 'selected_scholarships[1]', :type => 'checkbox')
      end
    end
  end

  describe "scholarship_list" do
    before(:each) do
      @bourse_aborigene_cycle_1 = Scholarship.create(:name => "Bourse cycle 1", :cycle => 1, :seq => '1')
      @bourse_cycle_2 = Scholarship.create(:name => "Bourse cycle 2", :cycle => 2, :seq => '2')
      assign :selected_cycles, {}
      assign :selected_types, {}
    end

    it "should display the proper message when no scholarships are found" do
      assign :scholarships, []
      render

      view_content_for(:colonneCentreSection).should have_selector('tr', :id=>'no_scholarship')
    end

    it "should display the proper message when no scholarships are found" do
      assign :scholarships, Scholarship.all
      render

      view_content_for(:colonneCentreSection).should have_selector('tr', :class=>'scholarship scholarship_odd')
      view_content_for(:colonneCentreSection).should have_selector('tr', :class=>'scholarship scholarship_even')
    end

  end
end
