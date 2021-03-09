require "rails_helper"

RSpec.feature "Visitor adds from home page to login", type: :feature, js: true do
  before :each do
    User.create!({
      first_name: "test",
      last_name: "account",
      email: "test@account.com",
      password: "password",
      password_confirmation: "password",
    })
  end

  scenario "They see the product page of selected" do
    # ACT
    visit root_path

    # VERIFY
    click_link "Account"
    click_link "Login"
    expect(page).to have_content("Email")
    fill_in "email", with: "test@account.com"
    fill_in "password", with: "password"
    click_button "Log in"
    expect(page).to have_content("Welcome, test!")
  end
end
