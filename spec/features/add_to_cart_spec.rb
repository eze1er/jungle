require 'rails_helper'
# require 'layouts/top_nav'

RSpec.feature "AddToCarts", type: :feature, js: true  do 
   # SETUP
   before :each do
    @category = Category.create! name: 'Apparel'

    1.times do |n|
      @category.products.create!(
        name:  Faker::Hipster.sentence(3),
        description: Faker::Hipster.paragraph(4),
        quantity: 10,
        price: 64.99
      )
    end
  end

  scenario "Should add 1 in the cart" do

    visit root_path

    # first('.product a').click
    product = page.first('article.product')
    save_and_open_screenshot
    button = page.find('form.button_to button:first-child')
    puts button

    # puts page.html

    button.click
    expect(page).to have_content("My Cart (1)")

  end 

end
