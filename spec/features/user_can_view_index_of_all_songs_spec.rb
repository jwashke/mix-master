require 'rails_helper'

RSpec.feature "User views index of all songs" do
  scenario "they see all songs alphabetically with links to their pages" do
    song1 = create(:song)
    song2 = create(:song)

    visit songs_path
        save_and_open_page
    expect(page).to have_content song1.title
    expect(page).to have_content song2.title
    expect(song1.title).to appear_before(song2.title)
  end

  scenario "they see all songs alphabetically for a specific artist with links to their pages" do
    song1 = create(:song)
    song2 = song1.artist.songs.create(title: "Apple")

    visit artist_path(song1.artist)
    click_on "View songs"

    expect(page).to have_content song1.title
    expect(page).to have_content song2.title
    expect(song2.title).to appear_before(song1.title)
  end
end
