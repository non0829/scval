class Talk < ApplicationRecord

    belongs_to :group, optional: true
    belongs_to :student, optional: true

    has_many :likes, dependent: :destroy
    has_many :liked_students, through: :likes, source: :student
    has_many :comments, dependent: :destroy

    # validates :content, presence: true

end
