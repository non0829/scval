class PostTag < ApplicationRecord
  belongs_to :test
  belongs_to :tag
end
