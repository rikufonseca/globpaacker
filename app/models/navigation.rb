class Navigation < ApplicationRecord
  belongs_to :user
  has_many :steps
  geocoded_by :ending_address
  after_validation :geocode, if: :will_save_change_to_ending_address?

  # validates :user_id, presence: true
  # validates :starting_longitude, presence: true
  # validates :starting_latitude, presence: true
  # validates :ending_longitude, presence: true
  # validates :ending_latitude, presence: true
  # validates :done, presence: true
  # validates :time_deadline, presence: true
  # validates :date, presence: true
end
