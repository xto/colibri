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

Given /^the following scholarships exist for given cycle and type$/ do |table|
  table.rows.each do |name, cycle, type|
    Scholarship.create(:name => name, :cycle=>cycle, :scholarship_type => type)
  end
end



When /^I search all scholarships$/ do
  visit path_to("the scholarship directory")

end

When /^I search the scholarships of first cycle$/ do
  visit path_to("the scholarship directory")
  check("cycles[first_cycle]")

end

When /^I search for the scholarships for Aboriginal people of the 1st cycle$/ do
  visit path_to("the scholarship directory")
  check("cycles[first_cycle]")
  check("types[aboriginal]")

end


Then /^I should only see the following scholarships/ do |table|
  with_scope("#scholarship_list") do
    all("table tr.scholarship").size.should == table.hashes.size
  end
  table.hashes.each do |scholarship|
    with_scope('#scholarship_list') do
      page.should have_content(scholarship[:name])
    end
  end
end

