require 'rails_helper'

RSpec.feature "User views index of artists" do
  scenario "they see all artists with links to their pages" do
    artist_name       = "The Beatles"
    artist_image_path = "http://cps-static.rovicorp.com/3/JPG_400/MI0003/146/MI0003146038.jpg"

    visit artists_path
    click_on "New artist"
    fill_in "artist_name", with: artist_name
    fill_in "artist_image_path", with: artist_image_path
    click_on "Create Artist"

    visit artists_path

    expect(page).to have_content artist_name

    click_on artist_name

    expect(page).to have_content artist_name
    expect(page).to have_css("img[src=\"#{artist_image_path}\"]")
  end
end
