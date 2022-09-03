class Reservation < ApplicationRecord
    belongs_to :user
    validates :hour, :day, :month, :year, :week,  presence: true
    validates :week, numericality: {greater_than_or_equal_to: Date.today.cweek}
    validates :year, numericality: {greater_than_or_equal_to: Date.today.year}
    validates :hour, uniqueness: {scope: %i[day week month year]}
    validates :hour, inclusion: {in: 6..23}
    validates :month, inclusion: {in: 1..12}
end
