class Task < ApplicationRecord
  belongs_to :challenge
  validates :question, presence: true
  validates :flag, presence: true, length: { maximum: 100 }
  
  scope :solved, -> { where(solved: true)}
  scope :not_solved, -> { where.not(solved: true)}
  
end
