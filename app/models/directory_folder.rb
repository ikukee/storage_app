class DirectoryFolder < ApplicationRecord
    has_many :items, dependent: :destroy
    validates :name, uniqueness: true
    #validates :hidden
    #validates :visibilty 
end
