require 'rails_helper'

RSpec.feature "User edits an existing song" do
  scenario "they see updated page for the individual song" do
    song = create(:song)

    visit song_path(song)

    click_on "Edit"
    fill_in "song_title", with: "Updated Title"
    click_on "Update Song"

    expect(page).to have_content "Updated Title"
  end
end
