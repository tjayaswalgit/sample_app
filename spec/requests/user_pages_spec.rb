require 'spec_helper'

describe "UserPages" do
  subject {page}

  describe "remember token" do
    let(:user) { FactoryGirl.create(:user)}
    before { @user.save }
    its(:remember_token) { should_not be_blank }
  end

  describe "signup" do
    before { visit signup_path }

    let(:submit) { "Create my account" }

    it { should respond_to(:password_confirmation) }
    it { should respond_to(:remember_token) }
    it { should respond_to(:authenticate) }


    describe "with invalid information" do
      it "should not create a user" do
        expect { click_button submit }.not_to change(User, :count)
      end
    end

    describe "with valid information" do

      before do
        fill_in "Name",         with: "Example User"
        fill_in "Email",        with: "user@example.com"
        fill_in "Password",     with: "foobar"
        fill_in "Confirmation", with: "foobar"
      end

      describe "after submission" do
        before { click_button submit }

        it { should have_selector('title', text: 'Sign up') }
        it { should have_content('error') }
      end
     
      describe "after saving the user" do
        before { click_button submit }
        let(:user) { User.find_by_email('user@example.com') }

        it { should have_selector('title', text: user.name) }
        it { should have_selector('div.alert.alert-success', text: 'Welcome') }
      end

      it "should create a user" do
        expect { click_button submit }.to change(User, :count).by(1)
      end

    it {should have_selector('h1' , text: 'Sign up')}
    it {should have_selector('title' , text: 'Sign up')}
  end
  
  describe "profile page" do
    #code to make a user variable
    let(:user) { FactoryGirl.create(:user)}
    before { visit user_path(user) }
    it {should have_selector('h1' , text: user.name)}
    it {should have_selector('title' , text: user.name)}
  end

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
end
