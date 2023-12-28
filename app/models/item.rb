class Item < ApplicationRecord
    has_one_attached :image, dependent: :destroy
    #validates :author

end
