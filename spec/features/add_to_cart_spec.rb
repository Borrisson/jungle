require "rails_helper"

RSpec.feature "Visitor adds from home page to login", type: :feature, js: true do
  before :each do
    @category = Category.create! name: "Apparel"
    User.create!({
      first_name: "test",
      last_name: "account",
      email: "test@account.com",
      password: "password",
      password_confirmation: "password",
    })

    1.times do |n|
      @category.products.create!(
        name: Faker::Hipster.sentence(3),
        description: Faker::Hipster.paragraph(4),
        image: open_asset("apparel1.jpg"),
        quantity: 10,
        price: 64.99,
      )
    end
  end

  scenario "They see the product page of selected" do
    # ACT
    visit root_path

    # VERIFY
    expect(page).to have_css "article.product", count: 1
    find("footer button").click
    expect(page).to have_content("Log in")
    fill_in "email", with: "test@account.com"
    fill_in "password", with: "password"
    click_button "Log in"
    find("footer button").click
    expect(page).to have_content("My Cart (1)")
  end
end
