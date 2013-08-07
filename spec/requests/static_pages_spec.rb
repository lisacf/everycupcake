require 'spec_helper'

describe "Static Pages" do
  describe "Home page" do
    it "should have the content 'Cupcake'" do
  	  visit home_path
  	  expect(page).to have_content('Cupcake')
    end
    it "should have the title 'Home'" do
      visit home_path
      expect(page).to have_title("Cupcake | Home")
    end
  end
  describe "Help page" do
  	it "should have the content 'Help'" do
  	  visit help_path
  	  expect(page).to have_content('Help')
  	end
    it "should have the title 'Help'" do
      visit help_path
      expect(page).to have_title("Cupcake | Help")
    end
  end
  describe "About page" do
  	it "should have the content 'About'" do
  	  visit about_path
  	  expect(page).to have_content('About')
  	end
    it "should have the title 'About'" do
      visit about_path
      expect(page).to have_title("Cupcake | About")
    end
  end
end
