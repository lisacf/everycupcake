Given /^I have recipes titled (.+)$/ do |titles|
  titles.split(', ').each do |title|
  	Recipe.create!(:title => title)
  end
end

When(/^I go to the list of recipes$/) do
  visit recipes_path
end

Then /^I should see "(.*?)"$/ do |title|
  page.should have_content (title)
end

Given(/^I have no recipes$/) do
  Recipe.delete_all
end

Given(/^I am on the list of recipes$/) do
  visit recipes_path
end

When(/^I follow "(.*?)"$/) do |arg1|
  click_link "New Recipe"
end

When(/^I fill in "(.*?)" with "(.*?)"$/) do |title, description|
  fill_in "Title", with: title
  fill_in "Description", with: description
end

When(/^I press "(.*?)"$/) do |arg1|
  click_button "Create"
end

Then(/^I should have ([0-9]+) recipe$/) do |count|
	Recipe.count.should == count.to_i
end