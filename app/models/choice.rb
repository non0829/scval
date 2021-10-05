class Choice < ApplicationRecord

    belongs_to :problem, inverse_of: :choices
end
