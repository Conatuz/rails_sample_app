require 'spec_helper'

describe "Static Pages" do
  
  #let(:base_title) { "Sample App" }
  subject { page } # page.should -> should
  
  describe "Home Page" do
    before { visit root_path }  # eliminates need to visit page each time
    
    it { should have_selector('h1', text: "Sample App") }
    it { should have_selector('title', text: full_title('') ) }
    it { should_not have_selector('title', text: " | Home") }
    
    # full_title() defined in /spec/support/utilities.rb
    
    #it "should have the h1 'Sample App'" do
    #  visit root_path
    #  page.should have_selector('h1', text: "Sample App")
    #end
    
    #it "should have the base title" do
    #  visit root_path
    #  page.should have_selector('title', text: "#{base_title}")
    #end
    
    #it "should not have a custom title" do
    #  visit root_path
    #  page.should_not have_selector('title', text: " | Home")
    #end
    
  end
  
  describe "Help Page" do
    before { visit help_path }
    
    it { should have_selector('h1', text: "Help") }
    it { should have_selector('title', text: full_title('Help') ) }
    
  end
  
  describe "About Page" do
    before { visit about_path }
    
    it { should have_selector('h1', text: "About Us") }
    it { should have_selector('title', text: full_title('About Us') ) }
    
  end
  
  describe "Contact Page" do
    before { visit contact_path }
    
    it { should have_selector('h1', text: "Contact") }
    it { should have_selector('title', text: full_title('Contact') ) }
    
  end
  
end
