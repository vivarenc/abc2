class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :guests, :foreign_key => "user_id"
  has_many :costs, :foreign_key => "user_id"
  has_many :services, :foreign_key => "user_id"
  has_many :ratings, :foreign_key => "user_id"
  has_many :calcs, :foreign_key => "user_id"
end
