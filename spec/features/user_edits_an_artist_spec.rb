require 'rails_helper'

RSpec.feature "User edits an existing artist" do
  scenario "they see updated page for the individual artist" do
    artist_image_path = "http://cps-static.rovicorp.com/3/JPG_400/MI0003/146/MI0003146038.jpg"
    artist = create(:artist)

    visit artist_path(artist)

    click_on "Edit"
    fill_in "artist_name", with: "Robert Marley"
    click_on "Update Artist"

    expect(page).to have_content "Robert Marley"
    expect(page).to have_css("img[src=\"#{artist_image_path}\"]")
  end
end
