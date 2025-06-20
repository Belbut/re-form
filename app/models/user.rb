class User < ApplicationRecord
  validates :name, :presence, length: {in: 2..15}
  validates :email, :presence
  validates :password, :presence, length: {in: 8..25}
end
