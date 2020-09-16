class Activity < ApplicationRecord
    validates :activity_name, presence: true
    validates :date, presence: true
    validates :duration, presence: true
end
