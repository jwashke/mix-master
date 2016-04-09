require 'rails_helper'

RSpec.feature "User can delete a song" do
  scenario "they delete a song from an artists songs and see the artists songs" do
    song = create(:song)

    visit artist_songs_path(song.artist)

    click_on "Delete"

    expect(page).to have_content song.artist.name
    expect(page).not_to have_content song.title
  end

  scenario "they delete a song from the song index and are returned to the song index" do
    song = create(:song)

    visit songs_path(song)

    click_on "Delete"
    expect(page).to have_content "All Songs"
    expect(page).not_to have_content song.title
  end
end
