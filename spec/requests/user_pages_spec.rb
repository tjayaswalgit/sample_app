require 'spec_helper'

describe "UserPages" do
  it "should have the h1 'Sign up'" do
      #visit '/static_pages/home'   Tests for the named routes
      visit signup_path
      page.should have_selector('h1', text: 'Sign up')
     end

     it "should have the title" do
      visit signup_path
      page.should have_selector('title',
                      text: 'Sign up')
     end     
end
