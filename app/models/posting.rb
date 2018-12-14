class Posting < ApplicationRecord
  belongs_to :user
  belongs_to :meteorite
  has_many :order

  validates :user, presence: true
  validates :meteorite, presence: true
  validates :weight, presence: true
  validates :cost, presence: true
end
