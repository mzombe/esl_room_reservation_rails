class Reservation < ApplicationRecord
    belongs_to :user
    validates :week, numericality: {greater_than_or_equal_to: Date.today.cweek}
    validates :year, numericality: {greater_than_or_equal_to: Date.today.year}
end
