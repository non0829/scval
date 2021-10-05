class Test < ApplicationRecord

    mount_uploader :image, ImageUploader
    has_many :problems, inverse_of: :test, dependent: :destroy
    accepts_nested_attributes_for :problems
    has_many :post_tags, dependent: :destroy
    has_many :tags, through: :post_tags
end
