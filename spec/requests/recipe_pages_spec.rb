require 'spec_helper'

describe "Recipe pages" do

	subject { page }

	let(:user) { FactoryGirl.create(:user) }
	before { sign_in user }

  describe "recipe creation" do
  	before {visit new_recipe_path }


  	describe "with invalid information" do
  		before {fill_in 'Name', with: ""}

  		it "should not create a recipe" do
  			expect { click_button "Submit Recipe" }.not_to change(Recipe, :count)
  		end

  		describe "error messages" do
  			before { click_button "Submit Recipe"}
  			it { should have_content('error') }
  		end
  	end

  	describe "with valid information" do
  		before do 
  			fill_in 'recipe_name', with: "Chocolate"
  			fill_in 'recipe_description', with: "Yummy recipe"
  			fill_in 'recipe_source', with: "Joy of Baking"
  		end

  		it "should create a recipe" do
  			expect { click_button "Submit Recipe" }.to change(Recipe, :count).by(1)
  		end
  	end
  end
end
