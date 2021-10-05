class Student < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :questions
  has_many :talks

  has_many :likes, dependent: :destroy
  has_many :liked_talks, through: :likes, source: :talk
  has_many :comments, dependent: :destroy

  validates :name, presence: true
  validates :group_code, numericality: { greater_than_or_equal_to: 10000 }
  validates :team, presence: true

  def already_liked?(talk)
    self.likes.exists?(talk_id: talk.id)
  end

end
