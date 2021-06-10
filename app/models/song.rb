class Song < ApplicationRecord
  validates :title, presence: true
  validates :title, uniqueness: {scope: :release_year, message: "Cannot release same song twice a year."}
  validates :released, inclusion: {:in => [true, false]}
  validates :release_year, presence: true, if: :released
  validates :artist_name, presence: true
  validate :valid_release_year

    def valid_release_year
      if release_year.present? && release_year > Time.now.year
        errors.add(:release_year, "Release year can only be the current year")
      end
    end
end
