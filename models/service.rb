class Service < ApplicationRecord
  belongs_to :user
  has_many :ratings, :foreign_key => "service_id"
end
