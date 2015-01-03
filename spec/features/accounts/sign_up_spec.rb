require "rails_helper"
feature "Accounts" do
	scenario "creating an account" do
		visit subscribem.root_path
		click_link "Account Sign Up"
		fill_in "Name", :with => "Test"
		fill_in "Email", :with => "subscribem@example.com"
		fill_in "Password", :with => "password"
		fill_in "Password confirmation", :with => "password"
		click_button "Create Account"
		success_message = "Your account has been successfully created."
		expect(page).to have_content(success_message)
		signed_in_message = "Signed in as subscribem@example.com"
		expect(page).to have_content(signed_in_message)
	 end
 end