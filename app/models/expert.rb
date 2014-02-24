class Expert < ActiveRecord::Base
  before_save { self.email = email.downcase }
  has_many :answers
  validates :username,  presence: true,length: { maximum: 50 }
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, presence: true, format: { with: VALID_EMAIL_REGEX }, uniqueness:{ case_sensitive: false }
  validates :level,  presence: true
  validates :question_answered, presence: true
  has_secure_password
  validates :password, length: { minimum: 6 }
end
