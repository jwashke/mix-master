require 'rails_helper'

RSpec.feature "User can view index of playlists" do
  scenario "they see all playlists with links to the playlists specific page" do
    playlist_one = create(:playlist_with_songs)
    playlist_two = create(:playlist_with_songs)

    visit playlists_path

    expect(page).to have_link playlist_one.name, href: playlist_path(playlist_one)
    expect(page).to have_link playlist_two.name, href: playlist_path(playlist_two)
  end
end
