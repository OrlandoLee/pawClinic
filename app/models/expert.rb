class Expert < ActiveRecord::Base
  before_save { self.email = email.downcase }
  before_create :create_remember_token
  
  has_many :answers
  validates :username,  presence: true,length: { maximum: 50 }
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, presence: true, format: { with: VALID_EMAIL_REGEX }, uniqueness:{ case_sensitive: false }
  validates :level,  presence: true
  validates :question_answered, presence: true
  has_secure_password
  validates :password, length: { minimum: 6 }
  
  
  def Expert.new_remember_token
      SecureRandom.urlsafe_base64
    end

    def Expert.encrypt(token)
      Digest::SHA1.hexdigest(token.to_s)
    end
  private
    def create_remember_token
      self.remember_token = Expert.encrypt(Expert.new_remember_token)
    end
end
