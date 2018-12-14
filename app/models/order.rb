class Order < ApplicationRecord
  belongs_to :user
  belongs_to :posting

  validates :user, presence: true
  validates :posting, presence: true
end
