require "rails_helper"

RSpec.feature "Sample", js: true do
  scenario "sample" do
    visit users_new_path

    # binding.pry

    expect(page).to have_content("Hello, world")
  end
end
