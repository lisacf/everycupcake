Feature: Manage Recipes
	In order to make a cupcake
	As an author
	I want to create and manage recipes

	Scenario: Recipes List
		Given I have recipes titled Dark Chocolate, Red Velvet
		When I go to the list of recipes
		Then I should see "Dark Chocolate"
		And I should see "Red Velvet"

	Scenario: Create Valid Recipe
		Given I have no recipes
		And I am on the list of recipes
		When I follow "New Recipe"
		And I fill in "Title" with "Vanilla"
		And I fill in "Description" with "Light fluffy cupcake"
		And I press "Create"
		Then I should see "New recipe created."
		And I should see "Vanilla"
		And I should see "Light fluffy cupcake"
		And I should have 1 recipe