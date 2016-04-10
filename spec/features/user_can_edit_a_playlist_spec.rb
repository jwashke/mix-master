require 'rails_helper'

RSpec.feature "User edits a playlist" do
  scenario "they see the updated playlist" do
    playlist = create(:playlist_with_songs)
    song_one = create(:song, title: "new_song")
    playlist_name = "updated playlist"
    song_two = playlist.songs.first

    visit playlist_path(playlist)

    click_on "Edit"
    fill_in "playlist_name", with: playlist_name
    uncheck("song-#{song_two.id}")
    check("song-#{song_one.id}")
    click_on "Update Playlist"
    
    expect(page).to have_content playlist_name
    expect(page).to have_content song_one.title
    expect(page).not_to have_content song_two.title
  end
end
