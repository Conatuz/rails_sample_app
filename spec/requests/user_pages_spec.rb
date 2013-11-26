require 'spec_helper'

describe "User Pages" do
  
  subject { page }
  
  describe "signup page" do
    before { visit signup_path }
    let(:submit) { "Create my account" }
    
    it { should have_selector('h1',     text: 'Sign up')  }
    it { should have_selector('title',  text: full_title('Sign up') ) }
    
    describe "with invalid information" do
      it "should not create a user" do
        expect { click_button submit }.not_to change(User, :count)
      end
      
      # error page check
      describe "after submission" do
        before { click_button submit }
        
        it { should have_selector('title', text: 'Sign up') }
        it { should have_content('error') }
      end
    end
    
    describe "with partially invalid information" do
      before do
        fill_in "Name",         with: "Example User"
        fill_in "Email",        with: "user@example.com"
        fill_in "Password",     with: "foobar"
        fill_in "Confirmation", with: "foobar"
      end
      
      describe "blank name" do
        before do
          fill_in "Name",         with: " "
          click_button submit 
        end
        it { should have_content('1 error') }
        it { should have_content("Name can't be blank") }
      end
      
      describe "blank email" do
        before do
          fill_in "Email",        with: " "
          click_button submit 
        end
        it { should have_content('2 errors') }
        it { should have_content("Email can't be blank") }
        it { should have_content("Email is invalid") }
      end
      
      describe "blank password" do
        before do
          fill_in "Password",     with: " "
          fill_in "Confirmation", with: " "
          click_button submit 
        end
        it { should have_content('errors') }
        it { should have_content("Password can't be blank") }
        it { should have_content("Password confirmation can't be blank") }
        it { should have_content("Password is too short") }
      end
      
      describe "too short password" do
        before do
          fill_in "Password",     with: "a" * 5
          fill_in "Confirmation", with: "a" * 5
          click_button submit 
        end
        it { should have_content('error') }
        it { should have_content("Password is too short") }
      end
      
      describe "mismatch password" do
        before do
          fill_in "Password",     with: "a" * 6
          fill_in "Confirmation", with: "b" * 6
          click_button submit 
        end
        it { should have_content('error') }
        it { should have_content("Password doesn't match confirmation") }
      end
      
      describe "invalid email" do
        before do
          fill_in "Email",        with: "me_at_here_com"
          click_button submit 
        end
        it { should have_content('1 error') }
        it { should have_content("Email is invalid") }
      end
      
    end
    
    describe "with valid information" do
      before do
        fill_in "Name",         with: "Example User"
        fill_in "Email",        with: "user@example.com"
        fill_in "Password",     with: "foobar"
        fill_in "Confirmation", with: "foobar"
      end
      
      it "should create a user" do
        expect { click_button submit }.to change(User, :count).by(1)
      end
      
      # Successful user flash, sign in after sign up
      describe "after saving the user" do
        before { click_button submit }
        let(:user) { User.find_by_email('user@example.com') }
        
        it { should have_selector('title', test: user.name) }
        it { should have_selector('div.alert.alert-success', test: 'Welcome') }
        # sign in after sign up
        it { should have_link('Sign out') }        
      end
    end
  end
  
  describe "profile page" do
    let(:user) { FactoryGirl.create(:user) }
    before { visit user_path(user) }
    
    it { should have_selector('h1',     text: user.name) }
    it { should have_selector('title',  text: user.name) }
  end
end
