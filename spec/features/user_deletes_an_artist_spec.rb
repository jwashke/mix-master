require 'rails_helper'

RSpec.feature "User deltes an existing artist" do
  scenario "they see the index with the artist no longer listed" do
    artist_name = "Bob Marley"
    artist_image_path = "http://cps-static.rovicorp.com/3/JPG_400/MI0003/146/MI0003146038.jpg"
    artist = Artist.create(name: artist_name, image_path: artist_image_path)

    visit artist_path(artist)
    click_on "Delete"

    expect(page).to have_content "New artist"
    expect(page).not_to have_content "Bob Marley"
  end
end
