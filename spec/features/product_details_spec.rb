require "rails_helper"

RSpec.feature "Visitor navigates to product page from home page", type: :feature, js: true do
  before :each do
    @category = Category.create! name: "Apparel"

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
    click_link "Details"
    expect(page).to have_css "section.products-show", count: 1
  end
end
