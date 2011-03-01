Given /^there is a "([^"]*)" cycle scholarship named "([^"]*)"$/ do |cycle, scholarship_name|
  Scholarship.create(:name => scholarship_name, :cycle => cycle)
end

Then /^I should see "([^"]*)" in the list of scholarships$/ do |scholarship_name|
  with_scope('#scholarship_list') do
    page.should have_content(scholarship_name)
  end
end

Then /^I should not see "([^"]*)" in the list of scholarships$/ do |scholarship_name|
  with_scope('#scholarship_list') do
    page.should_not have_content(scholarship_name)
  end
end