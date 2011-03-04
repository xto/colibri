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


end
