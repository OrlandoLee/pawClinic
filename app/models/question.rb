class Question < ActiveRecord::Base
  belongs_to :pet_owner
  validates :pet_owner_id, presence: true
  validates :content, presence: true
end
