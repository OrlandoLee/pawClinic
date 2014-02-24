class Answer < ActiveRecord::Base
  belongs_to :expert
  validates :expert_id, presence: true
  validates :content, presence: true
  validates :question_id, presence: true
end
