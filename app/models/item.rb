class Item < ApplicationRecord
    has_one_attached :image, dependent: :destroy
    #validates :author
    validate :file_name
    validate :file_type
end
