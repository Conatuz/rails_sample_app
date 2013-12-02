require 'spec_helper'

describe "Static Pages" do
  
  #let(:base_title) { "Sample App" }
  subject { page } # page.should -> should
  
  shared_examples_for "all static pages" do
    it { should have_selector('h1', text: heading) }
    it { should have_selector('title', text: full_title(page_title) ) }
  end
  
  it "should have the right links on the layout" do
    visit root_path
    click_link "About"
    should have_selector 'title', text: full_title('About Us')
    click_link "Help"
    should have_selector 'title', text: full_title('Help')
    click_link "Contact"
    should have_selector 'title', text: full_title('Contact')
    click_link "Home"
    click_link "Sign up now!"
    should have_selector 'title', text: full_title('Sign up')
    click_link "sample app"
    should have_selector 'title', text: full_title('')
  end
  
  describe "Home Page" do
    before { visit root_path }  # eliminates need to visit page each time
    let(:heading)     { 'Sample App' }
    let(:page_title)  { '' }
    
    it_should_behave_like "all static pages"
    it { should_not have_selector('title', text: " | Home") }
    
    #it { should have_selector('h1', text: "Sample App") }
    #it { should have_selector('title', text: full_title('') ) }
    
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
    
    describe "for signed-in users" do
      let(:user) { FactoryGirl.create(:user) }
      before do
        sign_in user
        visit root_path
      end
      
      describe "user feed" do
        before do
          FactoryGirl.create(:micropost, user: user, content: "Lorem ipsum")
          FactoryGirl.create(:micropost, user: user, content: "Dolor sit amet")
          visit root_path
        end
        it "should render the user's posts" do
          user.feed.each do |item|
            page.should have_selector("li##{item.id}", text: item.content)
          end
        end
        
        describe "pagination" do
          before(:all)  { 35.times { FactoryGirl.create(:micropost, user: user) } }
          after(:all)   { Micropost.delete_all }
          
          it { should have_selector('div.pagination') }
      
          it "should list first page" do
            Micropost.paginate(page: 1).each do |post|
              page.should have_selector('li', text: post.content)
            end
          end
          it "should not list second page" do
            Micropost.paginate(page: 2).each do |post|
              page.should_not have_selector('li', text: post.content)
            end
          end
          
        end
        
      end  # end of user feed
         
      describe "sidebar micropost counter" do
        
        describe "when no posts" do
          it { should have_content('0 microposts') }
        end
        describe "when 1 post" do
          before do
            FactoryGirl.create(:micropost, user: user, content: "Lorem ipsum")
            visit root_path
          end
          it { should have_content('1 micropost') }
          it { should_not have_content('1 microposts') }
        end
        describe "when 2 posts" do
          before do
            FactoryGirl.create(:micropost, user: user, content: "Lorem ipsum")
            FactoryGirl.create(:micropost, user: user, content: "Dolor sit amet")
            visit root_path
          end
          it { should have_content('2 microposts') }
        end
      end  # end of micropost counter
      
    end  # end of signed-in users
    
  end  # end of Home page
  
  describe "Help Page" do
    before { visit help_path }
    let(:heading)     { 'Help' }
    let(:page_title)  { 'Help' }
    
    it_should_behave_like "all static pages"
    
  end
  
  describe "About Page" do
    before { visit about_path }
    let(:heading)     { 'About Us' }
    let(:page_title)  { 'About Us' }
    
    it_should_behave_like "all static pages"
    
  end
  
  describe "Contact Page" do
    before { visit contact_path }
    let(:heading)     { 'Contact' }
    let(:page_title)  { 'Contact' }
    
    it_should_behave_like "all static pages"
    
  end
  
end
