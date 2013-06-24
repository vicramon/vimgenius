Given /^I am signed in as an admin$/ do
  visit admin_login_path
  fill_in :password, with: 'vimgenius'
  click_button 'Login'
end

Given /^I am on the admin dashboard$/ do
  expect(current_path).to eq admin_root_path
end
