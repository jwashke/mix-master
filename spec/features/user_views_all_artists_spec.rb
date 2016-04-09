require 'rails_helper'

RSpec.feature "User views index of artists" do
  scenario "they see all artists with links to their pages" do
    artist_name = "Bob Marley"
    artist_image_path = "http://cps-static.rovicorp.com/3/JPG_400/MI0003/146/MI0003146038.jpg"
    artist = Artist.create(name: artist_name, image_path: artist_image_path)

    visit artists_path

    expect(page).to have_content artist_name

    click_on artist_name

    expect(page).to have_content artist_name
    expect(page).to have_css("img[src=\"#{artist_image_path}\"]")
  end
end
