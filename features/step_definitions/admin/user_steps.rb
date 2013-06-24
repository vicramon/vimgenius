Given /^I have a user$/ do
  @user = Fabricate(:user)
end

Then /^I am on the admin users page$/ do
  expect(current_path).to eq admin_users_path
end

Then /^I see that user$/ do
  expect(page).to have_content @user.email
end
