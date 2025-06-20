class User < ApplicationRecord
  validates :name, presence: true, length: { in: 2..15 }
  validates :email, presence: true
  validates :password, presence: true, length: { in: 8..25 }
end
