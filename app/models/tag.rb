class Tag < ApplicationRecord
    has_many :post_tags, dependent: :destroy
    has_many :tests, through: :post_tags
end
