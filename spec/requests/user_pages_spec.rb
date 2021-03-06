require 'spec_helper'

describe "User Pages" do

    subject { page }

    describe "profile page" do
        let(:user) { FactoryGirl.create(:user) }
        before { visit user_path(user) }

        it { should have_content(user.name) }
    end

    describe "signup page" do
        before { visit signup_path }

        let(:submit) { "Create my account" }

        describe "With invalid info" do
            it "should not create a user" do
                expect { click_button submit }.not_to change(User, :count)
            end

        describe "after blank submission" do
            before { click_button submit }
            it { should have_title('Sign up')}
            it { should have_error_message_listing("Password can't be blank") }
            it { should have_error_message_listing("Password is too short (minimum is 6 characters)") }
            it { should have_error_message_listing("Name can't be blank") }
            it { should have_error_message_listing("Email can't be blank") }
            it { should have_error_message_listing("Email is invalid") }
        end
        end

        describe "with valid info" do
            before do
                fill_in "Name", with: "Example User"
                fill_in "Email", with: "user@example.com"
                fill_in "Password", with: "foobar"
                fill_in "Confirmation", with: "foobar"
            end
            
            it "should create a user" do
                expect { click_button submit }.to change(User, :count).by(1)
            end
            describe "after saving ther user" do
                before { click_button submit }
                let(:user) { User.find_by(email: 'user@example.com') }
                it { should have_title(user.name) }
                it { should have_selector('div.alert.alert-success', text: "Welcome") }
            end
        end
    end
end
