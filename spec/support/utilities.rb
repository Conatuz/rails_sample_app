include ApplicationHelper

def sign_in(user)
  visit signin_path
  fill_in "Email",    with: user.email
  fill_in "Password", with: user.password
  click_button "Sign in"
  # Sign in when not using Capybara as well
  cookies[:remember_token] = user.remember_token
end

RSpec::Matchers.define :have_error_message do |message|
  match do |page|
    page.should have_selector('div.alert.alert-error', text: message)
  end
end

RSpec::Matchers.define :have_success_message do |message|
  match do |page|
    page.should have_selector('div.alert.alert-success', text: message)
  end
end

# Signed out
RSpec::Matchers.define :have_out_root_header do
  match do |page|
    page.should have_selector('h1', text: 'Sample App')
  end
end

# Signed in
RSpec::Matchers.define :have_in_root_header do |user|
  match do |page|
    page.should have_selector('h1', text: user.name)
  end
end

# Included by ApplicationHelper now
#def full_title(page_title)
#  base_title = "Sample App"
#  if page_title.empty?
#    base_title
#  else
#    "#{base_title} | #{page_title}"
#  end
#end
