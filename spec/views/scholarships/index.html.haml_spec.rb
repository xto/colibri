require 'spec_helper'

describe "scholarships/index.html.haml" do

  it "should have a search action" do

  assign :scholarships, []
  render

  view_content_for(:colonneGauche).should have_selector('form', :action => '/scholarships/search')
  end


end
