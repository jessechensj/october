class User < ActiveRecord::Base
  before_create :lower_case_email
  
  EMAIL_REGEX = /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]+)\z/i
  validates :first_name, :last_name, presence: true
  validates :password, presence: true, on: :create
  validates :email, presence: true, uniqueness: { case_sensitive: false }, format: { with: EMAIL_REGEX }


  has_secure_password
  has_many :groups
  has_many :members, dependent: :destroy
  has_many :joined_groups, through: :members, source: :group

  private
    def lower_case_email
      self.email.downcase!
    end
end
