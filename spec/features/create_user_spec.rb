require "rails_helper"

RSpec.feature "User create", js: true do
  scenario "User create but enter dirrent passwords" do
    visit users_new_path

    fill_in "user[name]", with: "ジーズ たろう"

    fill_in "user[email]", with: "test@gmail.com"

    fill_in "user[self_introduction]", with: "カピバラ勉強中"

    fill_in "user[password]", with: "passwor"
    fill_in "user[password_confirmation]", with: "password"

    click_button "登録"
    expect(page).to have_current_path "/users/new"

  end
end
