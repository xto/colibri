Given /^the following scholarships exist$/ do |table|
  table.rows.each do |name|
    Scholarship.create(:name => name)
  end
end

Given /^the following scholarships exist for given cycle$/ do |table|
  table.rows.each do |name, cycle|
    Scholarship.create(:name => name, :cycle=>cycle)
  end
end


When /^I search all scholarships$/ do
  visit path_to("the scholarship directory")
  click_button("Search")
end

When /^I search the scholarships of first cycle$/ do
  visit path_to("the scholarship directory")
  check("cycles[first_cycle]")
  click_button("Search")
end


Then /^I should only see the following scholarships/ do |table|
  with_scope("#scholarship_list") do
    all("table tr").size.should == table.hashes.size + 1
  end
  table.hashes.each do |scholarship|
    with_scope('#scholarship_list') do
      page.should have_content(scholarship[:name])
    end
  end
end

