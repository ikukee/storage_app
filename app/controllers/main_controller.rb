class MainController < ApplicationController
    def index
    end
    def reset_database
        Item.all.each do |item|
            item.image.purge
        end
        DirectoryFolder.destroy_all
        redirect_to "/"
    end
end
