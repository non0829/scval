class Like < ApplicationRecord
  belongs_to :student
  belongs_to :talk

  validates_uniqueness_of :student_id, scope: :talk_id
end
