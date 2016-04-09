class Song < ActiveRecord::Base
  belongs_to :artist

  validates :title, presence: true
  scope :sorted, -> { order(:title) }
end
