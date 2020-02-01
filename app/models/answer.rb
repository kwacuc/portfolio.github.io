class Answer < ApplicationRecord
  belongs_to :question
  validates :name, presence: true
  validates :content, presence: true
end
