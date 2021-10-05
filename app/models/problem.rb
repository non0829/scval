class Problem < ApplicationRecord

    has_many :choices, inverse_of: :problem, dependent: :destroy
    belongs_to :test, inverse_of: :problems 
    accepts_nested_attributes_for :choices

end
