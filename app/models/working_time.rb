class WorkingTime < ApplicationRecord
  acts_as_paranoid

  belongs_to :venue, optional: true
  enum status: {open: 0, close: 1}
  enum day_in_week: {SUN: 0, MON: 1, TUE: 2, WED: 3, THU: 4, FRI: 6, SAT: 7}

  validates :working_from, presence: true
  validates :working_to, presence: true
  validates :day_in_week, presence: true
end
