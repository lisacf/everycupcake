require 'spec_helper'

describe "Static Pages" do

  subject { page }

  describe "Home page" do
    before { visit home_path }

    it { should have_content('Cupcake') }
    it { should have_title(full_title('')) }
    it { should_not have_title("| Home") }
  end
  describe "Help page" do
    before { visit help_path }

  	it { should have_content('Help') }
    it { should have_title("| Help") }
  end
  describe "About page" do
    before { visit about_path }

  	it { should have_content('About') }
    it { should have_title("| About") }
  end
  describe "Contact page" do
    before { visit contact_path }

    it { should have_content('Contact') }
    it { should have_title("| Contact") }
  end
end
