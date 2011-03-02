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


end
