class LifeExpectancy < ApplicationRecord
  belongs_to :location
  belongs_to :variant
end
