class Group < ActiveRecord::Base
  belongs_to :user
  has_many :members, dependent: :destroy
  has_many :users, through: :members

  validates :name, presence: true, length: { minimum: 6 }
  validates :description, presence: true, length: { minimum: 11 }
end
