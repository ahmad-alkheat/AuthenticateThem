require 'rails_helper'
feature 'User Sign In' do
	extend SubdomainHelpers
	let!(:account) {FactoryGirl.create(:account)}
let(:sign_in_url) { "http://#{account.subdomain}.example.com/sign_in" }	
let(:root_url) { "http://#{account.subdomain}.example.com/" }	
within_account_subdomain do
		scenario 'Sign in as an account owner successfully' do
			visit root_url
			expect(page.current_url).to eq (sign_in_url)
			fill_in 'Email', :with => 'account.owner.email'
			fill_in 'Password', :with => 'password'
			click_button 'Sign In'
			expect(page).to have_content ('You have successfully signed in')
			expect(page.current_url).to eq (root_url)
		end
	end
end