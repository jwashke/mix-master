require 'rails_helper'

RSpec.feature "User creates a song" do
  scenario "they see the song on the artists song index" do
    artist = create(:artist)

    song_title = "One Love"

    visit artist_path(artist)
    click_on "New song"
    fill_in "song_title", with: song_title
    click_on "Create Song"

    expect(page).to have_content song_title
    expect(page).to have_link artist.name, href: artist_path(artist)
  end
end
