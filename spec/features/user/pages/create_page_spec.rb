require "rails_helper"
feature "Create page" do
  include_context "current user signed in"

  scenario "User creates page with valid data" do
    visit new_page_path
    fill_in "Title", with: "New page"
    fill_in "Body", with: "New page content"
    click_button "Create Page"
    el = page.find(".top-bar")
    expect(el).to have_link "New page"
    expect(Page.count).to eq(1)
  end
  scenario "User creates page with invalid data" do
    visit new_page_path
    fill_in "Body", with: "New page content"
    click_button "Create Page"
    el = page.find(".top-bar")
    expect(el).to_not have_link "New page"
    expect(Page.count).to eq(0)
    el1 = page.find("div.page_title")
    expect(el1).to have_content("can't be blank")
  end
end
